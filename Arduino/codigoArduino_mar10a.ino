// Incluir biblioteca do DHT11
#include "DHT.h"

//Definindo as vareáveis
#define TIPO_SENSOR DHT11 //Definindo o tipo de sensor, sendo o DHT11
int PINO_SENSOR_DHT11 = A5; //Definindo o pino que será usado para a identificação do sensor
int maximo_umidade = 15;
float umidade;
float temperatura;
int minino_umidade = 0;
int maximo_temperatura = 20;
int minimo_temperatura = 5;

// Chamando as funções criadas acima
DHT sensorDHT(PINO_SENSOR_DHT11, TIPO_SENSOR);


void setup() { // Criando função para a configuração do dispositivo
  Serial.begin(9600); // Configurando o arduino
  sensorDHT.begin(); // Configurando o sensor
}

void loop(){ // Criando a função para o funcionamento do sensor e colocando ela em loop
  umidade = sensorDHT.readHumidity() - 34; // Criando a variável para armazenar a função de ler umidade do sensor
  temperatura = sensorDHT.readTemperature() - 10; // Criando a variável para armazenar a função de ler a temperatura do sensor

  if (isnan(temperatura)  ||  isnan(umidade)) { // Criando a condição, para caso não apareça algumas das informações pedidas
    Serial.println("Erro ao ler os dados do sensor");// Mostrando no serial, caso de erro
  } else { // Criando a condição para caso apareça as informações

 
  Serial.print("Umidade_sensor:");
  Serial.print(umidade);
  Serial.print(" ");
  Serial.print("Umidade_Maxima:");
  Serial.print(maximo_umidade);
  Serial.print(" ");
  Serial.print("Umidade_minima:");
  Serial.print(minino_umidade);
   Serial.print(" ");
  Serial.print("Temperatura_sensor:");
  Serial.print(temperatura);
  Serial.print(" ");
  Serial.print("Temperatura_Maxima:");
  Serial.print(maximo_temperatura);
  Serial.print(" ");
  Serial.print("Temperatura_minima:");
  Serial.println(minimo_temperatura);
  
  }

  delay(1000); // Criando a função 'delay' para acontecer um intervalo para cada ação
  }