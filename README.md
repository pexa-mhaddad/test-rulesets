# GitHub Rulesets with Dependabot Auto-Merge Test

This repository demonstrates how to use GitHub rulesets with Dependabot auto-merge in a monorepo structure.

## Repository Structure

- `/terraform` - Contains Terraform code with AWS provider dependency
- `/npm` - Contains a Node.js project with npm dependencies
- `/.github` - Contains GitHub workflows, Dependabot configuration, and rulesets

## How It Works

1. Dependabot is configured to monitor both Terraform and npm dependencies
2. Separate GitHub workflows validate changes in each directory:
   - `terraform-validate` job for Terraform changes
   - `npm-validate` job for npm changes
3. GitHub rulesets enforce specific status checks:
   - Terraform updates only require Terraform-specific checks
   - npm updates only require npm-specific checks
4. Dependabot auto-merge is configured to merge PRs that pass the required checks

## Testing Instructions

1. Push this code to your GitHub repository
2. In the GitHub repository settings, navigate to "Code security and analysis"
3. Enable Dependabot security updates and version updates
4. Navigate to "Settings" > "Code and automation" > "Rulesets"
5. Create two new rulesets using the JSON files in `.github/rulesets/`:
   - Create a ruleset for Terraform using `terraform-ruleset.json`
   - Create a ruleset for npm using `npm-ruleset.json`
6. Configure the rulesets to apply to Dependabot PRs:
   - For the Terraform ruleset, add a condition for PRs that modify files in the `terraform/` directory
   - For the npm ruleset, add a condition for PRs that modify files in the `npm/` directory
7. Wait for Dependabot to create PRs or trigger them manually
8. Observe that:
   - PRs updating Terraform dependencies only need to pass Terraform checks
   - PRs updating npm dependencies only need to pass npm checks
   - PRs that pass their respective checks are auto-merged