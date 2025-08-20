# 📱 APK Build Workflows

This repository provides multiple GitHub Actions workflows to build custom APK files for the Health Campaign Field Worker App with different environment configurations.

## 🎯 Available Workflows

### 1. **Build APK with Custom Environment** (`build-apk.yml`)
Build a single APK with completely custom environment configuration.

### 2. **Build Multiple APKs** (`build-multiple-apks.yml`)
Build multiple APKs for different environments in parallel.

### 3. **Build APK (Predefined Environments)** (`build-predefined-environments.yml`)
Build APK using predefined environment configurations (unified-dev, unified-qa, etc.).

## 🤔 Which Workflow Should I Use?

| Use Case | Recommended Workflow | Why? |
|----------|---------------------|------|
| **I have a custom backend setup** | Custom Environment | Full control over all configuration parameters |
| **I need APKs for multiple environments** | Multiple APKs | Build several APKs at once, saves time |
| **I want to use DIGIT's standard environments** | Predefined Environments | Pre-configured, quick and easy |
| **I'm testing the app for the first time** | Predefined Environments | Start with `unified-dev` |
| **I'm deploying to production** | Custom Environment | Ensure all settings match your production setup |

## 🚀 How to Use

### For Custom Environment (build-apk.yml)
1. Go to **Actions** → **Build APK with Custom Environment**
2. Click **Run workflow**
3. Fill in all your custom environment variables
4. Click **Run workflow** and wait ~15-20 minutes
5. Download APK from **Artifacts** section

### For Multiple Environments (build-multiple-apks.yml)
1. Go to **Actions** → **Build Multiple APKs**
2. Click **Run workflow**
3. Enter comma-separated values for:
   - Environments: `DEV,QA,UAT`
   - Base URLs: `https://dev.domain.com/,https://qa.domain.com/,https://uat.domain.com/`
   - Tenant IDs: `dev-tenant,qa-tenant,uat-tenant`
4. Click **Run workflow**
5. Download all generated APKs from **Artifacts**

### For Predefined Environments (build-predefined-environments.yml)
1. Go to **Actions** → **Build APK (Predefined Environments)**
2. Click **Run workflow**
3. Select from available environments:
   - `unified-dev` - Development environment
   - `unified-qa` - QA environment
   - `unified-uat` - UAT environment
   - `hcm-demo` - Demo environment
   - `gcp-test` - GCP test environment
   - `ondo-hcm` - Ondo HCM production
4. Choose build type and optional custom app name
5. Click **Run workflow** and download the APK

## ⚙️ Configuration Parameters

### Required Parameters

| Parameter | Description | Example |
|-----------|-------------|---------|
| **Base URL** | Your backend service URL | `https://your-domain.com/` |
| **MDMS API Path** | MDMS service endpoint | `egov-mdms-service/v1/_search` |
| **Tenant ID** | Your tenant identifier | `your-tenant-id` |
| **Actions API Path** | Actions API endpoint | `access/v1/actions/mdms/_get` |
| **Hierarchy Type** | Boundary hierarchy type | `ADMIN` or `MICROPLAN` |
| **Environment Name** | Target environment | `DEV`, `QA`, `UAT`, `DEMO`, `PROD` |
| **Build Type** | APK build configuration | `release` or `profile` |

### Optional Parameters

| Parameter | Description | Default | Notes |
|-----------|-------------|---------|-------|
| **Sync Down Retry Count** | Number of sync retries | `3` | How many times to retry failed syncs |
| **Retry Time Interval** | Retry delay in seconds | `5` | Wait time between retries |
| **Connection Timeout** | Network timeout (ms) | `120000` | 2 minutes |
| **Receive Timeout** | Response timeout (ms) | `120000` | 2 minutes |
| **Send Timeout** | Request timeout (ms) | `120000` | 2 minutes |
| **Check Bandwidth API** | Bandwidth check endpoint | `/health-project/check/bandwidth` | API for checking connection speed |
| **Artifact Name** | Custom APK name | `health-campaign-app` | Base name for the APK file |

## 🔧 Environment Examples

### Development Environment
```
Base URL: https://unified-dev.digit.org/
MDMS API Path: egov-mdms-service/v1/_search
Tenant ID: dev
Environment Name: DEV
```

### Production Environment
```
Base URL: https://your-production-domain.com/
MDMS API Path: mdms-v2/v1/_search
Tenant ID: your-prod-tenant
Environment Name: PROD
```

## 📋 Build Types

### Release Build
- **Use for**: Production deployments
- **Characteristics**: Optimized, smaller size, no debug info
- **Command**: `flutter build apk --release`

### Profile Build
- **Use for**: Performance testing
- **Characteristics**: Optimized but with some debug capabilities
- **Command**: `flutter build apk --profile`

## 📂 APK Output

The generated APK will be named: `{artifact-name}-{environment}-{build-type}.apk`

Examples:
- `health-campaign-app-DEV-release.apk`
- `custom-hcm-app-PROD-release.apk`

## 🔍 Troubleshooting

### Common Issues

1. **Workflow Fails During Build**
   - Check if all required parameters are provided
   - Verify your Base URL is accessible
   - Ensure tenant ID is correct

2. **APK Not Generated**
   - Check the workflow logs for Flutter build errors
   - Verify environment configuration is valid

3. **App Crashes on Install**
   - Ensure Base URL is accessible from your device
   - Check tenant ID matches your backend setup

### Getting Help

If you encounter issues:
1. Check the workflow run logs for detailed error messages
2. Verify your backend service is accessible
3. Ensure all environment parameters match your server configuration

## 🏗️ Workflow Details

The workflow performs these steps:
1. Sets up Flutter and Java development environment
2. Installs project dependencies (mason, melos)
3. Creates `.env` file with your configuration
4. Runs project setup scripts (`install_bricks.sh`)
5. Generates code using `build_runner`
6. Builds APK with Flutter
7. Uploads APK as downloadable artifact

**Total estimated time**: 15-20 minutes

## 🔒 Security Notes

- Environment variables are only used during the build process
- No sensitive data is stored in the repository
- APK artifacts are automatically deleted after 30 days
- Only repository collaborators can trigger the workflow
