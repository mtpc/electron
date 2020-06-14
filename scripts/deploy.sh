set -e

LERNA_JSON=`cat lerna.json`;
export LERNA_VERSION="$(node -pe "JSON.parse(\`$LERNA_JSON\`)['version']")"

echo "Deploying Capacitor-Electron v$LERNA_VERSION"

# This is what we do instead of letting lerna git commit for us
git add lerna.json
git add electron-core/package.json
git add electron-platform/package.json
git commit -m "Release v$LERNA_VERSION"
git tag $LERNA_VERSION -m $LERNA_VERSION
git push --follow-tags origin master