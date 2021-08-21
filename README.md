# Overview

Version your artifacts with Virgo

Uses [`envsubst`](https://github.com/a8m/envsubst#envsubst) (the go version).

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

_NOTE: The job should go before any publish jobs so that templates are fully populated._

In the above example, the mentioned `.psd1` file has a line:

```sh
ModuleVersion = '0.1.${GITHUB_RUN_NUMBER}'
```

After the virgo job completes, it contains something like:

```sh
ModuleVersion = '0.1.42'
```

 (depending on what the actual run number was).  This is convenient for auto-incrementing patch versions prior to publishing.

## Example: Project path

```sh
    # A URL to the main website for this project.
    ProjectUri = 'https://github.com/${GITHUB_REPOSITORY}'
    # A URL to the license for this module.
    LicenseUri = 'https://github.com/${GITHUB_REPOSITORY}/blob/master/LICENSE'
```

This reduces duplication and makes templates more re-usable across repositories.

## Custom variables

GitHub actions support defining your own [environment variables](https://docs.github.com/en/actions/reference/environment-variables).

Examples:

* Externalize author, description, and/or copyright information
* Make artifact metadata conditional based on branch/tag, etc.
