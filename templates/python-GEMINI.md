# Python Project Context for Gemini CLI

## Project Overview

**Project Name**: [Your Python Project]
**Framework**: [Django/Flask/FastAPI/CLI Tool]
**Python Version**: [3.8+/3.9+/3.10+]
**Purpose**: [Brief description of the project's purpose]

## Code Standards

### Python Style Guidelines
- **Follow PEP 8** style guidelines strictly
- **Use type hints** for all function signatures and class attributes
- **Write comprehensive docstrings** following Google or NumPy style
- **Prefer pathlib** over os.path for file operations
- **Use f-strings** for string formatting
- **Keep line length** under 88 characters (Black default)

### Naming Conventions
- **Variables**: `snake_case`
- **Functions**: `snake_case`
- **Classes**: `PascalCase`
- **Constants**: `UPPER_SNAKE_CASE`
- **Private methods**: `_leading_underscore`

## Mandatory Tooling

When creating or modifying any `.py` files, you **must** run these commands from the root of the project:

```bash
# Format code (Black)
black .

# Sort imports (isort)
isort .

# Check and fix linting issues (Ruff)
ruff check --fix .

# Type checking (mypy)
mypy .

# Run tests
pytest
```

## Project Structure

```
project-root/
├── src/
│   └── package_name/
│       ├── __init__.py
│       ├── main.py          # Entry point
│       ├── models/          # Data models
│       ├── services/        # Business logic
│       ├── utils/           # Utility functions
│       └── config.py        # Configuration
├── tests/
│   ├── __init__.py
│   ├── unit/               # Unit tests
│   ├── integration/        # Integration tests
│   └── conftest.py         # Pytest configuration
├── docs/                   # Documentation
├── requirements.txt        # Production dependencies
├── requirements-dev.txt    # Development dependencies
├── pyproject.toml         # Build system and tool config
└── README.md
```

## Development Workflow

### Environment Setup
```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements-dev.txt

# Install package in development mode
pip install -e .
```

### Daily Development Commands
```bash
# Run the application
python -m package_name

# Run with specific environment
ENVIRONMENT=development python -m package_name

# Run tests with coverage
pytest --cov=src/package_name --cov-report=html

# Generate documentation
sphinx-build -b html docs docs/_build
```

## Testing Standards

### Testing Framework
- **Primary**: pytest
- **Coverage**: pytest-cov (minimum 90% coverage)
- **Fixtures**: Use pytest fixtures for common setup
- **Mocking**: Use unittest.mock or pytest-mock

### Test Structure
```python
def test_function_name_should_expected_behavior_when_condition():
    # Arrange
    input_data = "test_input"
    expected_result = "expected_output"
    
    # Act
    result = function_under_test(input_data)
    
    # Assert
    assert result == expected_result
```

### Test Categories
- **Unit tests**: Test individual functions/methods
- **Integration tests**: Test component interactions
- **End-to-end tests**: Test complete workflows
- **Property-based tests**: Use hypothesis for edge cases

## Type Hints and Documentation

### Function Documentation
```python
def process_data(
    data: list[dict[str, Any]], 
    filter_criteria: str | None = None
) -> dict[str, Any]:
    """Process input data according to specified criteria.
    
    Args:
        data: List of dictionaries containing raw data
        filter_criteria: Optional string to filter data
        
    Returns:
        Dictionary with processed results
        
    Raises:
        ValueError: If data is empty or invalid
        ProcessingError: If processing fails
    """
    if not data:
        raise ValueError("Data cannot be empty")
    
    # Implementation here
    return {"processed": True, "count": len(data)}
```

### Class Documentation
```python
class DataProcessor:
    """Handles data processing operations.
    
    This class provides methods for cleaning, transforming,
    and validating input data according to business rules.
    
    Attributes:
        config: Configuration settings for processing
        logger: Logger instance for this processor
    """
    
    def __init__(self, config: ProcessingConfig) -> None:
        self.config = config
        self.logger = logging.getLogger(__name__)
```

## Error Handling

### Exception Hierarchy
```python
class ProjectBaseException(Exception):
    """Base exception for this project."""
    pass

class ValidationError(ProjectBaseException):
    """Raised when input validation fails."""
    pass

class ProcessingError(ProjectBaseException):
    """Raised when data processing fails."""
    pass
```

### Error Handling Pattern
```python
def safe_operation(data: Any) -> Result[str, Error]:
    """Perform operation with explicit error handling."""
    try:
        # Process data
        result = process_data(data)
        return Ok(result)
    except ValidationError as e:
        logger.error(f"Validation failed: {e}")
        return Err(f"Invalid input: {e}")
    except ProcessingError as e:
        logger.error(f"Processing failed: {e}")
        return Err(f"Processing error: {e}")
    except Exception as e:
        logger.exception("Unexpected error occurred")
        return Err(f"Unexpected error: {e}")
```

## Configuration Management

### Settings Structure
```python
from pydantic import BaseSettings, Field
from typing import Literal

class Settings(BaseSettings):
    """Application settings."""
    
    environment: Literal["development", "staging", "production"] = "development"
    debug: bool = Field(default=False, env="DEBUG")
    database_url: str = Field(env="DATABASE_URL")
    api_key: str = Field(env="API_KEY")
    log_level: str = Field(default="INFO", env="LOG_LEVEL")
    
    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"
```

## Logging Configuration

```python
import logging
import structlog

# Configure structured logging
structlog.configure(
    processors=[
        structlog.stdlib.filter_by_level,
        structlog.stdlib.add_logger_name,
        structlog.stdlib.add_log_level,
        structlog.stdlib.PositionalArgumentsFormatter(),
        structlog.processors.TimeStamper(fmt="iso"),
        structlog.processors.StackInfoRenderer(),
        structlog.processors.format_exc_info,
        structlog.processors.UnicodeDecoder(),
        structlog.processors.JSONRenderer()
    ],
    context_class=dict,
    logger_factory=structlog.stdlib.LoggerFactory(),
    wrapper_class=structlog.stdlib.BoundLogger,
    cache_logger_on_first_use=True,
)

logger = structlog.get_logger(__name__)
```

## Performance Guidelines

### General Performance
- **Use generators** for large datasets
- **Implement caching** for expensive operations
- **Profile code** with cProfile for bottlenecks
- **Use appropriate data structures** (sets for membership, deques for queues)

### Database Operations
- **Use connection pooling** for database connections
- **Implement proper indexing** strategies
- **Use bulk operations** for large datasets
- **Avoid N+1 queries** in ORM operations

## Security Best Practices

- **Never hardcode secrets** in source code
- **Use environment variables** for sensitive configuration
- **Validate all inputs** using Pydantic or similar
- **Sanitize user inputs** to prevent injection attacks
- **Use secure random** for generating tokens
- **Keep dependencies updated** and scan for vulnerabilities

## Dependency Management

### Core Dependencies
```txt
# requirements.txt
fastapi>=0.100.0
pydantic>=2.0.0
sqlalchemy>=2.0.0
alembic>=1.11.0
structlog>=23.0.0
```

### Development Dependencies
```txt
# requirements-dev.txt
pytest>=7.0.0
pytest-cov>=4.0.0
black>=23.0.0
isort>=5.0.0
ruff>=0.0.280
mypy>=1.0.0
pre-commit>=3.0.0
```

## Pre-commit Hooks

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/psf/black
    rev: 23.3.0
    hooks:
      - id: black
  
  - repo: https://github.com/pycqa/isort
    rev: 5.12.0
    hooks:
      - id: isort
  
  - repo: https://github.com/charliermarsh/ruff-pre-commit
    rev: v0.0.280
    hooks:
      - id: ruff
        args: [--fix, --exit-non-zero-on-fix]
  
  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v1.4.1
    hooks:
      - id: mypy
```

## Additional Instructions for AI

When working with this Python codebase:

1. **Always use type hints** for function parameters and return values
2. **Follow the existing patterns** for error handling and logging
3. **Write docstrings** for all public functions and classes
4. **Include appropriate tests** for new functionality
5. **Use dataclasses or Pydantic models** for structured data
6. **Prefer composition over inheritance** where possible
7. **Keep functions small** and focused on single responsibilities
8. **Use context managers** for resource management
9. **Follow the DRY principle** but don't over-abstract
10. **Consider performance implications** of your implementation choices

---

*Template Version: 1.0*
*Last Updated: 2025-06-26* 