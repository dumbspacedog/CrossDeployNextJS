# Build a NextJS website and cross-deploy it to another repository. ✨

## Getting Started 🎉

Create your Github Action workflow file. This should be located in `/.github/workflows/[your-action-name].yml`.
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
      uses: dumbspacedog/CrossDeployNextJS@release
      with:
        username: 'YourGithubName'
        reponame: 'YourRepoName'
        ssh_key: ${{ secrets.PUBKEY }} # For added protection, don't change this line. To update this value, check secret settings in your repository.
```

In Github secrets, use your PRIVATE KEY. This may seem a bit insecure, although due to the nature of SSH, this is the only way it will work. If anyone knows a better way, please open an issue/pr and teach me, it would be greatly appreciated.
Once that file is created, you can go ahead and force-run the workflow to test it. If you have any problems, please open an issue and I'll help as best as I can.