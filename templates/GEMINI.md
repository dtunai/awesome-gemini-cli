# Project Context for Gemini CLI

<!-- 
This is a template GEMINI.md file for providing context to Gemini CLI.
Copy this to your project root and customize it for your specific needs.
-->

## Project Overview

**Project Name**: [Your Project Name]
**Technology Stack**: [e.g., React + TypeScript + Node.js]
**Purpose**: [Brief description of what this project does]

## Code Standards

### General Principles
- Write clean, readable, and maintainable code
- Follow established patterns and conventions
- Prioritize simplicity and clarity
- Include comprehensive documentation

### Language-Specific Guidelines
<!-- Customize based on your primary language -->

#### JavaScript/TypeScript
- Use TypeScript for all new code
- Follow ESLint configuration
- Use Prettier for consistent formatting
- Prefer async/await over Promise chains
- Use meaningful variable and function names

#### Python
- Follow PEP 8 style guidelines
- Use type hints for all functions
- Write comprehensive docstrings
- Prefer pathlib over os.path for file operations

## Development Workflow

### Setup Commands
```bash
# Install dependencies
npm install  # or pip install -r requirements.txt

# Start development server
npm run dev  # or python manage.py runserver

# Run tests
npm test    # or pytest

# Build for production
npm run build  # or python setup.py build
```

### Code Quality Tools

#### Mandatory Commands
Run these before committing any code:

```bash
# Format code
npm run format     # or black . && isort .

# Lint code
npm run lint       # or ruff check --fix .

# Type checking
npm run type-check # or mypy .

# Run tests
npm test          # or pytest
```

## Project Structure

```
project-root/
├── src/                 # Source code
│   ├── components/      # Reusable components
│   ├── utils/          # Utility functions
│   └── types/          # Type definitions
├── tests/              # Test files
├── docs/               # Documentation
└── config/             # Configuration files
```

## Testing Standards

- Aim for 80%+ test coverage
- Write unit tests for all business logic
- Include integration tests for key workflows
- Use meaningful test descriptions
- Mock external dependencies

## Documentation Requirements

- Update README.md for significant changes
- Document all public APIs
- Include inline comments for complex logic
- Maintain changelog for releases

## Deployment & Infrastructure

### Environment Variables
<!-- List key environment variables -->
- `NODE_ENV`: Development environment
- `API_BASE_URL`: Backend API endpoint
- `DATABASE_URL`: Database connection string

### Deployment Process
1. Ensure all tests pass
2. Update version numbers
3. Build production assets
4. Deploy to staging for testing
5. Deploy to production

## Security Considerations

- Never commit secrets or API keys
- Use environment variables for sensitive data
- Validate all user inputs
- Follow OWASP security guidelines
- Regular dependency updates

## Performance Guidelines

- Optimize for Core Web Vitals (if web app)
- Lazy load non-critical resources
- Implement proper caching strategies
- Monitor bundle sizes
- Use appropriate data structures

## Team Preferences

### Communication
- Use descriptive commit messages
- Link issues in pull requests
- Provide clear PR descriptions
- Request reviews from relevant team members

### Code Review Checklist
- [ ] Code follows style guidelines
- [ ] Tests are included and passing
- [ ] Documentation is updated
- [ ] No security vulnerabilities
- [ ] Performance considerations addressed

## Domain-Specific Context

<!-- Add any domain-specific information -->
### [Industry/Domain] Specific Requirements
- [Regulatory compliance requirements]
- [Industry standards to follow]
- [Domain-specific terminology]

## Additional Instructions for AI

When working with this codebase:

1. **Always follow the established patterns** found in existing code
2. **Prioritize maintainability** over clever solutions
3. **Include error handling** for all external calls
4. **Write self-documenting code** with clear variable names
5. **Consider edge cases** and validation
6. **Follow the testing philosophy** established in the project
7. **Respect the architecture** and don't introduce unnecessary complexity

---

*Last Updated: [Date]*
*Version: [Version]* 