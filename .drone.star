# load() means "import".
# The actual code is located here:
#    https://github.com/getgoing/starlarklib
load('@common//asb:spec.star', 'get_build_spec')

PROJECT_NAME = 'kyotocabinet'

VALIDATION_COMMANDS = {
    'lint check': {'steps': ['make pep8']},
    'formatting check': {'steps': ['make black_check']},
    'imports order check': {'steps': ['make isort_check']},
    'unit tests': {'steps': ['make test_unit']},
}

DOCKERFILE = 'Dockerfile.ci'

def main(ctx):
    return get_build_spec(
        ctx=ctx,
        config={
            'DOCKERFILE': DOCKERFILE,
            'PROJECT_NAME': PROJECT_NAME,
            'VALIDATION_COMMANDS': VALIDATION_COMMANDS,
        },
        spec_type='package_lib',
        spec_version='1.0.0',
    )
