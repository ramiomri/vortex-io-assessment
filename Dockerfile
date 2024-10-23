FROM public.ecr.aws/lambda/python:3.12

# Write Docker commands to package your Python application with its dependencies
# so that it can

# tips: a python 'requirements.txt' file to insall the Python dependencies with pip
# can be generated using 'poetry export --without-hashes > lambda_app/requirements.txt'
# before building the image with 'docker build ...'

# COPY lambda_app/app.py ${LAMBDA_TASK_ROOT}
COPY lambda_app ${LAMBDA_TASK_ROOT}/lambda_app

COPY lambda_app/requirements.txt .

RUN pip install -r requirements.txt 

# Set CMD so that the entry point of the lambda is the 'lambda_handler' function.
CMD ["lambda_app.app.lambda_handler"]
