FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime

RUN pip install pandas scikit-learn matplotlib opencv-python==4.8.1.78 tensorboard

RUN apt update
RUN apt install libgl1-mesa-glx -y
RUN apt-get install libglib2.0-0 -y
RUN apt-get install vim -y

RUN pip install torchsummary

COPY classification_train.py /workspace/classification_train.py
COPY classification_datasets.py /workspace/classification_datasets.py
COPY classification_models.py /workspace/classification_models.py

CMD ["python", "classification_train.py"]
