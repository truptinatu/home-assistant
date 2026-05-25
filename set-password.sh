#!/bin/bash
# ─────────────────────────────────────────────────────────────────
# Home Assistant — Password updater
# Run: bash set-password.sh
# ─────────────────────────────────────────────────────────────────

DIR="$(cd "$(dirname "$0")" && pwd)"
INDEX="$DIR/index.html"

echo ""
echo "🏠 Home Assistant — Set Password"
echo "─────────────────────────────────"
echo ""

read -s -p "  New password: " PASSWORD
echo ""
read -s -p "  Confirm:      " PASSWORD2
echo ""

if [ "$PASSWORD" != "$PASSWORD2" ]; then
  echo ""
  echo "❌  Passwords don't match. Try again."
  exit 1
fi

if [ ${#PASSWORD} -lt 6 ]; then
  echo ""
  echo "❌  Password must be at least 6 characters."
  exit 1
fi

# Generate SHA-256 hash
HASH=$(python3 -c "import hashlib; print(hashlib.sha256('${PASSWORD}'.encode()).hexdigest())")

# Update index.html
sed -i '' "s/const PASSWORD_HASH = \"[a-f0-9]*\"/const PASSWORD_HASH = \"${HASH}\"/" "$INDEX"

echo ""
echo "✅  Password updated."
echo ""
echo "  Push to go live:"
echo "  cd ~/home-assistant && git add index.html && git commit -m 'update: password' && git push"
echo ""
