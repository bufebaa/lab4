
if [ -f "index.html" ]; then
    echo "index.html exists."
else
    echo "index.html is missing!" >&2
    exit 1
fi

if [ -f "page2.html" ]; then
    echo "page2.html exists."
else
    echo "page2.html is missing!" >&2
    exit 1
fi

if grep -q "Welcome to My Simple Website" "index.html"; then
    echo "index.html content is correct."
else
    echo "index.html content is incorrect!" >&2
    exit 1
fi

if grep -q "This is Page 2" "page2.html"; then
    echo "page2.html content is correct."
else
    echo "page2.html content is incorrect!" >&2
    exit 1
fi

echo "All tests passed!"
