# ... (Previous steps) ...

# Set the working directory
WORKDIR /app

# Copy requirement file(s)
COPY requirements.txt .

# 1. Create the virtual environment named `.venv`
# 2. Source the activate script in the same command to set the shell path.
# 3. Use the venv's `uv` to install dependencies.
RUN uv venv .venv \
    && . .venv/bin/activate \
    && uv pip install -r requirements.txt

# Copy the rest of your application code
COPY . .

# Command to run your application using the venv's python
CMD ["/app/.venv/bin/python", "your_app_file.py"]