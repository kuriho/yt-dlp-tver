echo "GITHUB_WORKSPACE: $Env:GITHUB_WORKSPACE"
echo "GITHUB_SHA: $Env:GITHUB_SHA"
echo "GITHUB_REF: $Env:GITHUB_REF"
echo "GITHUB_ACTOR: $Env:GITHUB_ACTOR"
echo "GITHUB_REPOSITORY: $Env:GITHUB_REPOSITORY"
git --version

git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"
