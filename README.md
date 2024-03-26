# DataLakeHouse-DeltaLake-EMR
Projeto para criação de uma arquitetura Data LakeHouse com Delta Lake e AWS EMR.

## Pré-requisitos
Antes de fazer o deploy desta arquitetura é necessário que alguns pré-requisitos sejam atendidos.

- Conta na aws e usuário IAM com as permições necessárias para a criação dos recursos utilizados.
- Bucket terraform-state-datalake-dlhdlemr, esse bucket é usado para armazenar o backend do terraform, portanto, precisa existir antes de iniciar o deploy.
- EC2 key_pair dlhdlemr-key-pair, necessário para a criação do cluster do emr.

## Autenticação
Para realizar a autenticação na AWS CLI, precisam ser configurados os secrets "AWS_ACCESS_KEY_ID" e "AWS_SECRET_ACCESS_KEY" no repositório do projeto no github.

## Infrastructure
Códigos terraform para criação dos recursos de infraestrutura na AWS.

- variables.tf: Variáveis terraform.
- provider.tf: Cofigurações do provedor cloud. 
- s3.tf: Cria bucket.
- s3_files: Importa os scripts python para o bucket.
- lambda.tf: Criação do recurso lambda na aws.
- iam: Criação da role para o lambda e vinculando a uma policy.

## ETL
Scripts que serão executados pela lambda function. A função lambda cria um cluster EMR e executa os scripts "01_delta_spark_insert.py" e "02_delta_spark_upsert.py".

- 01_delta_spark_insert.py: Conversão dos dados de csv para parquet. Neste exemplo, os microdados do Enem 2019 em csv são convertidos para parquet.
  - s3://datalake-teste/raw-data/enem -> Datalake onde estão salvos os dados que serão transformados. Neste exemplo, estão sendo utilizados os microdados do Enem de 2019.
- 02_delta_spark_upsert.py: Transformação dos dados usando delta table.

## Desalocando Recursos Localmente
Desalocando os recursos criados na AWS pelo terraform localmente.
<<<<<<< HEAD
- 1° -> Configurar AWS CLI na máquina local
- 2° -> Criar arquivo dentro da pasta infrastrucute o arquivo "lambda_function_payload.zip", apenas porque este arquivo é utilizado pela lamba function. Não precisa ter nenhum dado específico dentro deste arquivo, ele precisa apenas existir.
- 3° -> Dentro de infrastrucute executar o comando: terraform init.
- 4° -> Dentro de infrastrucute executar o comando: terraform destroy.
=======

- 1° -> Criar arquivo dentro da pasta infrastrucute o arquivo "lambda_function_payload.zip", apenas porque este arquivo é utilizado pela lamba function. Não precisa ter nenhum dado específico dentro deste arquivo, ele precisa apenas existir.
- 2° -> Dentreo de infrastrucute executar o comando: terraform destroy
>>>>>>> 85aeccc47398bdfdf19708030d9d68f0d6af0a67

OBS: Só são excluídos os recursos criados pelo terrraform, portanto os recursos criados manualmente e pela lambda function, deverão ser excluídos manualmente.

## Referências microdados Enem

<<<<<<< HEAD
 Microdados Enem: https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/enem
=======
 Microdados Enem: https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/enem
>>>>>>> 85aeccc47398bdfdf19708030d9d68f0d6af0a67
