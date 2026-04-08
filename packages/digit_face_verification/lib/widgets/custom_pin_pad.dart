import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom PIN pad with number grid and dot indicators.
/// Designed for face auth fallback PIN entry.
/// Colors are derived from the app's Theme unless explicitly overridden.
class CustomPinPad extends StatefulWidget {
  final int pinLength;
  final void Function(String pin) onComplete;
  final String? errorMessage;
  final String? title;
  final String? subtitle;
  final String submitLabel;
  final Color? primaryColor;

  const CustomPinPad({
    super.key,
    this.pinLength = 4,
    required this.onComplete,
    this.errorMessage,
    this.title,
    this.subtitle,
    this.submitLabel = 'Submit PIN',
    this.primaryColor,
  });

  @override
  State<CustomPinPad> createState() => _CustomPinPadState();
}

class _CustomPinPadState extends State<CustomPinPad>
    with SingleTickerProviderStateMixin {
  String _pin = '';
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn),
    );
  }

  @override
  void didUpdateWidget(covariant CustomPinPad oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.errorMessage != null && oldWidget.errorMessage == null) {
      _shakeController.forward(from: 0);
      HapticFeedback.mediumImpact();
      // Clear pin after error shake
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) setState(() => _pin = '');
      });
    }
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _addDigit(String digit) {
    if (_pin.length >= widget.pinLength) return;
    HapticFeedback.lightImpact();
    setState(() => _pin += digit);
  }

  void _removeDigit() {
    if (_pin.isEmpty) return;
    HapticFeedback.lightImpact();
    setState(() => _pin = _pin.substring(0, _pin.length - 1));
  }

  void _submit() {
    if (_pin.length == widget.pinLength) {
      HapticFeedback.mediumImpact();
      widget.onComplete(_pin);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final color = widget.primaryColor ?? colorScheme.primary;
    final textPrimary = colorScheme.onSurface;
    final textSecondary = colorScheme.onSurface.withOpacity(0.6);
    final dividerColor = theme.dividerColor;
    final errorColor = colorScheme.error;
    final hasError = widget.errorMessage != null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textPrimary,
            ),
          ),
          const SizedBox(height: 6),
        ],
        if (widget.subtitle != null) ...[
          Text(
            widget.subtitle!,
            style: TextStyle(fontSize: 14, color: textSecondary),
          ),
          const SizedBox(height: 24),
        ],

        // Dot indicators
        AnimatedBuilder(
          animation: _shakeAnimation,
          builder: (context, child) {
            final offset = _shakeAnimation.value *
                10 *
                ((_shakeController.value * 8).toInt().isEven ? 1 : -1);
            return Transform.translate(
              offset: Offset(offset, 0),
              child: child,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.pinLength, (i) {
              final filled = i < _pin.length;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hasError
                      ? (filled
                          ? errorColor
                          : errorColor.withOpacity(0.2))
                      : (filled ? color : Colors.transparent),
                  border: Border.all(
                    color: hasError
                        ? errorColor
                        : (filled ? color : dividerColor),
                    width: 2,
                  ),
                ),
              );
            }),
          ),
        ),

        // Error message
        if (hasError) ...[
          const SizedBox(height: 12),
          Text(
            widget.errorMessage!,
            style: TextStyle(
              color: errorColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],

        const SizedBox(height: 28),

        // Number grid
        SizedBox(
          width: 280,
          child: Column(
            children: [
              _buildRow(['1', '2', '3'], textPrimary, dividerColor,
                  textSecondary),
              const SizedBox(height: 12),
              _buildRow(['4', '5', '6'], textPrimary, dividerColor,
                  textSecondary),
              const SizedBox(height: 12),
              _buildRow(['7', '8', '9'], textPrimary, dividerColor,
                  textSecondary),
              const SizedBox(height: 12),
              _buildRow(
                  ['', '0', 'back'], textPrimary, dividerColor, textSecondary),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Submit button
        SizedBox(
          width: 280,
          height: 48,
          child: ElevatedButton(
            onPressed: _pin.length == widget.pinLength ? _submit : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              disabledBackgroundColor: dividerColor,
              foregroundColor: colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: Text(
              widget.submitLabel,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(
    List<String> keys,
    Color textPrimary,
    Color borderColor,
    Color iconColor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: keys.map((key) {
        if (key.isEmpty) {
          return const SizedBox(width: 80, height: 56);
        }
        if (key == 'back') {
          return _PadButton(
            onTap: _removeDigit,
            borderColor: borderColor,
            child: Icon(
              Icons.backspace_outlined,
              size: 22,
              color: iconColor,
            ),
          );
        }
        return _PadButton(
          onTap: () => _addDigit(key),
          borderColor: borderColor,
          child: Text(
            key,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: textPrimary,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _PadButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color borderColor;
  final Widget child;

  const _PadButton({
    required this.onTap,
    required this.borderColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 72,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor),
            ),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
