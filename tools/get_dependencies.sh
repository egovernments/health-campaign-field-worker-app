dir=$(PWD)

for i in / /packages/forms_engine/ /packages/digit_components/; do
  cd "$dir$i" || exit
  flutter clean
  flutter packages get
done