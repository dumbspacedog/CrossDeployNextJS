# Build a NextJS website and cross-deploy it to another repository. ✨

## Getting Started 🎉

1. Create your Github Action workflow file. This should be located in `/.github/workflows/[your-action-name].yml`.
In this file, your action will look something along the line(s) of this:
```yml
name: Cross-deploy NextJS Website
on:
  push:
    branches: ["main"] # Change the branch you want to publish here.
jobs:
  build_nextjs:
    runs-on: ubuntu-latest
    name: Build NextJS
    steps:
    - uses: actions/checkout@v2
    - id: Build-Next-Website
      uses: dumbspacedog/CrossDeployNextJS@1.0.0
      with:
        username: 'YourGithubName'
        reponame: 'YourRepoName'
        ssh_key: ${{ secrets.PUBKEY }} # For added protection, don't change this line. To update this value, check secret settings in your repository.
```
