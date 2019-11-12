FROM mcr.microsoft.com/dotnet/core/sdk:3.0
LABEL maintainer "Ody Mbegbu <odytrice@gmail.com>"

RUN apt-get update
RUN apt-get --assume-yes install apt-transport-https python3-pip

RUN pip3 install jupyterlab

RUN dotnet tool install --global dotnet-try
ENV PATH "$PATH:/root/.dotnet/tools"
RUN dotnet try jupyter install

RUN jupyter kernelspec list

EXPOSE 8888

RUN mkdir /notebooks

CMD ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--port=8888", "--notebook-dir=/notebooks"]