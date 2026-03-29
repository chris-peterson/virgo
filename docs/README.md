# <img src="favicon.svg" alt="virgo" width="64" height="64" style="vertical-align: middle"> virgo

Version your artifacts with [virgo](https://github.com/marketplace/actions/substitute-env-vars) (aka `substitute env vars`).

Uses [`envsubst`](https://github.com/a8m/envsubst#envsubst) (the Go version).

## Inputs

| name | description | required |
| --- | --- | --- |
| `templates` | comma-separated list of template files to process | yes |

## Example: Auto-increment Patch Version

```yaml
# ... prior job steps
      - name: Substitute env vars in files
        uses: chris-peterson/virgo@v1
        with:
          templates: "src/futility/futility.psd1"
# ... additional job steps
```

> [!NOTE]
> The job should go before any publish jobs so that templates are fully populated.

In the above example, the `.psd1` file has a line:

```bash
ModuleVersion = '0.1.${GITHUB_RUN_NUMBER}'
```

After the virgo job completes, it contains something like:

```bash
ModuleVersion = '0.1.42'
```

(depending on the actual run number). This is convenient for auto-incrementing patch versions prior to publishing.

## Example: Project Path

```bash
    # A URL to the main website for this project.
    ProjectUri = 'https://github.com/${GITHUB_REPOSITORY}'
    # A URL to the license for this module.
    LicenseUri = 'https://github.com/${GITHUB_REPOSITORY}/blob/master/LICENSE'
```

This reduces duplication and makes templates more reusable across repositories.

## Custom Variables

GitHub Actions support defining your own [environment variables](https://docs.github.com/en/actions/reference/environment-variables).

Examples:

* Externalize author, description, and/or copyright information
* Make artifact metadata conditional based on branch/tag, etc.
