/*
  Por Alberto Robles Enciso
  Primero de ing.informatica(20/03/2016)
  Programado en Processing 3(processing.org)
  
  Programado con el fin de demostrar como usando 
  primitivas 2D se puede lograr un entorno 3D
  completo facilmente, solamente usando matrices
  y algebra basica.
  
  El programa esta orientado a objetos con el fin
  de facilizar su uso.
 */
class Tres {
  private float[] centro;
  private float x;
  private float y;
  private float z;
  private float altura;
  private float anchura;
  private float longitud;
  private float[][] cubo;
  private float[][] cubo_r;
  private float[] giro = new float[3];
  private float scale;
  private boolean puntos_ad[][];
  private int tipo;
  private int puntos_num;
  private float[][] base = {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}};
  private float[][] base_o = {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}};
  public Tres (float x, float y, float z, float altura, float anchura, float longitud, int tipo, float[][] base) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.altura = altura;
    this.anchura = anchura;
    this.longitud = longitud;
    this.tipo = tipo;
    this.base = base;
    this.base_o = base;

   // Creacion del objeto
    if (this.tipo == 1) { // Rectangulo
      this.puntos_num = 8;
      cubo = new float[puntos_num][3];
      cubo_r = new float[puntos_num][3];
      this.cubo[1][0] = this.altura;
      this.cubo[2][1] = this.anchura;
      this.cubo[3][2] = this.longitud;
      this.cubo[4][0] = this.altura;
      this.cubo[4][1] = this.anchura;
      this.cubo[5][0] = this.altura;
      this.cubo[5][2] = this.longitud;
      this.cubo[6][1] = this.anchura;
      this.cubo[6][2] = this.longitud;
      this.cubo[7][0] = this.altura;
      this.cubo[7][1] = this.anchura;
      this.cubo[7][2] = this.longitud;
      this.cubo_r = this.cubo;
      // Matriz de adyacencia de puntos
      puntos_ad = new boolean[puntos_num][puntos_num];
      puntos_ad[0][1] = true;
      puntos_ad[0][2] = true;
      puntos_ad[0][3] = true;
      puntos_ad[2][6] = true;
      puntos_ad[3][6] = true;
      puntos_ad[1][4] = true;
      puntos_ad[4][7] = true;
      puntos_ad[5][7] = true;
      puntos_ad[1][5] = true;
      puntos_ad[2][4] = true;
      puntos_ad[6][7] = true;
      puntos_ad[3][5] = true;
    } else if (this.tipo == 2) { // Piramide(base cuadrada)
      this.puntos_num = 5;
      cubo = new float[puntos_num][3];
      cubo_r = new float[puntos_num][3]; 
      this.cubo[2][1] = this.anchura;
      this.cubo[1][2] = this.longitud;
      this.cubo[3][1] = this.anchura;
      this.cubo[3][2] = this.longitud;
      this.cubo[4][0] = this.altura;
      this.cubo[4][2] = this.longitud/2;
      this.cubo[4][1] = this.anchura/2;
      this.cubo_r = this.cubo;
      // Matriz de adyacencia de puntos
      puntos_ad = new boolean[puntos_num][puntos_num];
      puntos_ad[0][1] = true;
      puntos_ad[0][2] = true;
      puntos_ad[1][3] = true;
      puntos_ad[2][3] = true;
      puntos_ad[4][0] = true;
      puntos_ad[4][1] = true;
      puntos_ad[4][2] = true;
      puntos_ad[4][3] = true;
    } else if (this.tipo == 3) { // Octaedro
      this.puntos_num = 6;
      cubo = new float[puntos_num][3];
      cubo_r = new float[puntos_num][3];
      this.cubo[0][0] = this.altura/2;
      this.cubo[0][1] = -this.longitud/2;
      this.cubo[0][2] = -this.anchura/2;
      this.cubo[1][0] = this.altura/2;
      this.cubo[1][1] = -this.longitud/2;
      this.cubo[1][2] = this.anchura/2;
      this.cubo[2][0] = this.altura/2;
      this.cubo[2][1] = this.longitud/2;
      this.cubo[2][2] = -this.anchura/2;
      this.cubo[3][0] = this.altura/2;
      this.cubo[3][1] = this.longitud/2;
      this.cubo[3][2] = this.anchura/2;
      this.cubo[4][0] = this.altura;
      this.cubo_r = this.cubo;
      puntos_ad = new boolean[puntos_num][puntos_num];
      puntos_ad[0][1] = true;
      puntos_ad[0][2] = true;
      puntos_ad[1][3] = true;
      puntos_ad[2][3] = true;
      puntos_ad[4][0] = true;
      puntos_ad[4][1] = true;
      puntos_ad[4][2] = true;
      puntos_ad[4][3] = true;
      puntos_ad[5][0] = true;
      puntos_ad[5][1] = true;
      puntos_ad[5][2] = true;
      puntos_ad[5][3] = true;
    } else if (this.tipo == 4) { // BiPiramide triangular
      this.puntos_num = 5;
      cubo = new float[puntos_num][3];
      cubo_r = new float[puntos_num][3];
      this.cubo[0][0] = this.altura/2;
      this.cubo[0][1] = -this.longitud/2;
      this.cubo[0][2] = -this.anchura/2;
      this.cubo[1][0] = this.altura/2;
      this.cubo[1][2] = this.anchura/2;
      this.cubo[1][1] = -this.longitud/2;
      this.cubo[2][0] = this.altura/2;
      this.cubo[2][1] = this.longitud/2;
      this.cubo[3][0] = this.altura;
      this.cubo_r = this.cubo;
      puntos_ad = new boolean[puntos_num][puntos_num];
      puntos_ad[0][1] = true;
      puntos_ad[0][2] = true;
      puntos_ad[0][3] = true;
      puntos_ad[1][3] = true;
      puntos_ad[2][1] = true;
      puntos_ad[3][0] = true;
      puntos_ad[3][1] = true;
      puntos_ad[3][2] = true;
      puntos_ad[4][0] = true;
      puntos_ad[4][1] = true;
      puntos_ad[4][2] = true;
    }

    vertex_num += this.puntos_num; // Añado los vertices al contador de ellos
    // MiniAlgoritmo para contar las aristas
    for (int i = 0; i < puntos_num; i++) {
      for (int j = 0; j < puntos_num; j++) {
        if (puntos_ad[i][j] == true) {
          edges_num++;
        }
      }
    }
  }  

  public void rotar(float x, float y, float z) {
    this.giro[0] += x;
    this.giro[1] += y;
    this.giro[2] += z;
    this.rotar_cubo();
  }

  public float[] centro() {
    return this.centro;
  }

  public void rotar_cubo() {
    float[][] proy = new float[puntos_num][3];
    for (int i = 0; i < puntos_num; i++) {
      float[] rota = new float[3];
      rota[0] = this.cubo[i][0];
      rota[1] = this.cubo[i][1];
      rota[2] = this.cubo[i][2];
      float[] rota_t = rota_z(rota_y(rota_x(rota, this.giro[0]), this.giro[1]), this.giro[2]);
      proy[i][0] = rota_t[0];
      proy[i][1] = rota_t[1];
      proy[i][2] = rota_t[2];
    }
    this.cubo_r = proy;
  }

  public float[] posicion() {
    float[] pos = {this.x, this.y, this.z};
    return pos;
  }

  public void scale_change(float scale) {
    this.scale = scale;
    this.base[0][0] = this.base[0][0] * scale;
    this.base[0][1] = this.base[0][1] * scale;
    this.base[0][2] = this.base[0][2] * scale;
    this.base[1][0] = this.base[1][0] * scale;
    this.base[1][1] = this.base[1][1] * scale;
    this.base[1][2] = this.base[1][2] * scale;
    this.base[2][0] = this.base[2][0] * scale;
    this.base[2][1] = this.base[2][1] * scale;
    this.base[2][2] = this.base[2][2] * scale;
  }

  public float[] posicion_punto(int i, int status) {
    float[] pos = new float[3];
    if (status == 1) {
      pos[0] = this.cubo[i][0];
      pos[1] = this.cubo[i][1];
      pos[2] = this.cubo[i][2];
    } else if (status == 2) {
      pos[0] = this.cubo_r[i][0];
      pos[1] = this.cubo_r[i][1];
      pos[2] = this.cubo_r[i][2];
    } else {
      float[] obj = {this.cubo_r[i][0], this.cubo_r[i][1], this.cubo_r[i][2]};
      pos = projection(productoMatriz_Especial(this.base, obj), new float[] {this.x, this.y, this.z});
    }
    return pos;
  }

  public void mover(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  public void desplazar(float x, float y, float z) {
    this.x += x;
    this.y += y;
    this.z += z;
  }


  public void rotar_base(float giro_x, float giro_y, float giro_z) {
    for (int i = 0; i < 3; i++) {
      float[] rota = new float[3];
      rota[0] = this.base_o[i][0];
      rota[1] = this.base_o[i][1];
      rota[2] = this.base_o[i][2];
      //println(rota);
      float[] rota_t = rota_z(rota_y(rota_x(rota, giro_x), giro_y), giro_z);
      this.base_o[i][0] = rota_t[0];
      this.base_o[i][1] = rota_t[1];
      this.base_o[i][2] = rota_t[2];
    }
  }

  private float[] productoMatriz_Especial(float[][] A, float[] B) {
    float[] result = new float[3];

    for (int i = 0; i < 3; i++) {
      result[i] = A[0][i] * B[0] + A[1][i] * B[1] + A[2][i] * B[2];
    }

    return result;
  }

  private void UpdateBase() {
    float[][] result = new float[3][3];

    for (int j = 0; j < 3; j++) {
      for (int i = 0; i < 3; i++) {
        result[i][j] = this.base_o[0][j] * base_global[i][0] + this.base_o[1][j] * base_global[i][1] + this.base_o[2][j] * base_global[i][2];
      }
    }

    this.base = result;
  }

  private float[][] proyectar() {
    float[][] proy = new float[puntos_num][2];
    for (int i = 0; i < puntos_num; i++) {
      float[] obj = {this.cubo_r[i][0], this.cubo_r[i][1], this.cubo_r[i][2]};
      float[] proy_t = projection(productoMatriz_Especial(this.base, obj), new float[] {this.x, this.y, this.z});
      proy[i][0] = proy_t[0];
      proy[i][1] = proy_t[1];
    }
    return proy;
  }

  public void draw(float scale, float[] centro) {
    this.scale = scale;
    this.centro = centro;
    UpdateBase(); // Actualizo la base local en base a la global

    float[][] proy = this.proyectar();

    stroke(0, 0, 0);

    // Nuevo algoritmo de lineas por adyacencia de puntos
    for (int i = 0; i < puntos_num; i++) {
      for (int j = 0; j < puntos_num; j++) {
        if (puntos_ad[i][j] == true) {
          line(this.centro[0] + proy[i][0], this.centro[1] - proy[i][1], this.centro[0] + proy[j][0], this.centro[1] - proy[j][1]);
        }
      }
    }
    this.draw_axis(50);
  }

  private void draw_axis(float size) {
    // Dibujo los ejes locales
    float[] orig = {this.x, this.y, this.z};
    float[] proy_o = projection(new float[] {0, 0, 0}, orig);
    float[] proy_x = projection(new float[] {size*this.base[0][0], size*this.base[0][1], size*this.base[0][2]}, orig);
    float[] proy_y = projection(new float[] {size*this.base[1][0], size*this.base[1][1], size*this.base[1][2]}, orig);
    float[] proy_z = projection(new float[] {size*this.base[2][0], size*this.base[2][1], size*this.base[2][2]}, orig);
    stroke(255, 0, 0); // X (Altura, arriba)
    line(this.centro[0] + proy_o[0], this.centro[1] - proy_o[1], this.centro[0] + proy_x[0], this.centro[1] - proy_x[1]);
    stroke(0, 255, 0); // Y (Anchura, izquierda)
    line(this.centro[0] + proy_o[0], this.centro[1] - proy_o[1], this.centro[0] + proy_y[0], this.centro[1] - proy_y[1]);
    stroke(0, 0, 255); // Z (Longitud, derecha)
    line(this.centro[0] + proy_o[0], this.centro[1] - proy_o[1], this.centro[0] + proy_z[0], this.centro[1] - proy_z[1]);
  }

  public void draw_shadow(Tres foco) {
    float[] foco_pos = foco.posicion();
    foco_pos[0] = foco_pos[0] - this.x;
    foco_pos[1] = foco_pos[1] - this.y;
    foco_pos[2] = foco_pos[2] - this.z;
    float[][] proy = new float[puntos_num][2];
    for (int i = 0; i < puntos_num; i++) {
      float[] obj = {this.cubo_r[i][0], this.cubo_r[i][1], this.cubo_r[i][2]};
      float[] proy_s = shadow_projection(productoMatriz_Especial(this.base, obj), foco_pos, new float[] {this.x, this.y, this.z});
      float[] proy_t = projection(proy_s, new float[] {this.x, this.y, this.z});
      proy[i][0] = proy_t[0];
      proy[i][1] = proy_t[1];
    }

    // Nuevo algoritmo de lineas por adyacencia de puntos
    for (int i = 0; i < puntos_num; i++) {
      //stroke(0, 0, 0);
      stroke(80, 120, 220);
      for (int j = 0; j < puntos_num; j++) {
        if (puntos_ad[i][j] == true) {
          line(this.centro[0] + proy[i][0], this.centro[1] - proy[i][1], this.centro[0] + proy[j][0], this.centro[1] - proy[j][1]);
        }
      }
      stroke(234, 234, 79);
      float[] punto = productoMatriz_Especial(this.base, new float[] {this.cubo_r[i][0], this.cubo_r[i][1], this.cubo_r[i][2]});
      float[] punto_proy = projection(new float[] {this.x, this.y, this.z}, new float[] {punto[0], punto[1], punto[2]});
      float[] foco_proy = projection(new float[] {this.x, this.y, this.z}, new float[] {punto[0] + foco_pos[0], punto[1] + foco_pos[1], punto[2] + foco_pos[2]});
      line(foco.centro[0] + punto_proy[0], foco.centro[1] - punto_proy[1], foco.centro[0] + foco_proy[0], foco.centro[1] - foco_proy[1]);
      stroke(175, 175, 120);
      line(foco.centro[0] + punto_proy[0], foco.centro[1] - punto_proy[1], this.centro[0] + proy[i][0], this.centro[1] - proy[i][1]);
    }
  }

  public void draw_shadow2(Tres foco) {
    float[] foco_pos = foco.posicion();
    if (this.x + this.altura < foco_pos[0] ) {
      foco_pos[0] = foco_pos[0] - this.x;
      foco_pos[1] = foco_pos[1] - this.y;
      foco_pos[2] = foco_pos[2] - this.z;
      float[][] proy = new float[puntos_num][2];
      for (int i = 0; i < puntos_num; i++) {
        float[] obj = {this.cubo_r[i][0], this.cubo_r[i][1], this.cubo_r[i][2]};
        float[] proy_s = shadow_projection2(productoMatriz_Especial(this.base, obj), foco_pos, new float[] {this.x, this.y, this.z});

        float[] proy_t = projection(proy_s, new float[] {this.x, this.y, this.z});
        proy[i][0] = proy_t[0];
        proy[i][1] = proy_t[1];
      }

      // Nuevo algoritmo de lineas por adyacencia de puntos
      for (int i = 0; i < puntos_num; i++) {
        stroke(220, 120, 80);
        for (int j = 0; j < puntos_num; j++) {
          if (puntos_ad[i][j] == true) {
            line(this.centro[0] + proy[i][0], this.centro[1] - proy[i][1], this.centro[0] + proy[j][0], this.centro[1] - proy[j][1]);
          }
        }
        stroke(234, 180, 79);
        float[] punto = productoMatriz_Especial(this.base, new float[] {this.cubo_r[i][0], this.cubo_r[i][1], this.cubo_r[i][2]});
        float[] punto_proy = projection(new float[] {this.x, this.y, this.z}, new float[] {punto[0], punto[1], punto[2]});
        float[] foco_proy = projection(new float[] {this.x, this.y, this.z}, new float[] {foco_pos[0], foco_pos[1], foco_pos[2]});
        line(foco.centro[0] + punto_proy[0], foco.centro[1] - punto_proy[1], foco.centro[0] + foco_proy[0], foco.centro[1] - foco_proy[1]);
        stroke(175, 130, 120);
        line(foco.centro[0] + punto_proy[0], foco.centro[1] - punto_proy[1], this.centro[0] + proy[i][0], this.centro[1] - proy[i][1]);
      }
    }
  }
}

int cubos_num = 9;
int vertex_num = 0;
int edges_num = 0;
Tres[] cubos = new Tres[9];

float[] centro = {640.0, 270.0};
float[][] base_global = {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}}; // Base global

float scale = 1;
float ejes_log = 200;

// TODO: Eje X Arriba(Altura), Y Izquierda(Anchura) y Z Derecha(longitud).

float giro_x = grados2radianes(0);
float giro_y = grados2radianes(0);
float giro_z = grados2radianes(0);

float alfa = grados2radianes(90); //90º
float beta = grados2radianes(210); //210º
float gamma = grados2radianes(330); //330º
float alfa_degree = 90;
float beta_degree = 210;
float gamma_degree = 330;
float alfa_mod = 1;
float beta_mod = 1;
float gamma_mod = 1;

int modo_proyeccion = 1;
int modo_realtime = 1;
boolean realist_shadows = true;

void setup() {
  size(1280, 720);

  cubos[0] = new Tres(70, 0, 0, 75, 20, 40, 1, new float[][] {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}});
  cubos[1] = new Tres(0, 0, 0, 25, 40, 45, 2, new float[][] {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}});
  cubos[2] = new Tres(0, 0, 0, 15, 20, 90, 1, new float[][] {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}});
  cubos[3] = new Tres(0, 0, 0, 35, 20, 40, 1, new float[][] {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}});
  cubos[4] = new Tres(0, 70, 0, 90, 40, 40, 3, new float[][]  {{1, 0, 0}, {0, -1, 0}, {0, 0, 2}});
  cubos[5] = new Tres(0, 0, 140, 70, 50, 50, 4, new float[][] {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}});
  cubos[6] = new Tres(145, 0, 0, 30, 20, 40, 2, new float[][] {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}});
  cubos[7] = new Tres(35, 0, 0, 35, 20, 40, 2, new float[][] {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}});
  cubos[8] = new Tres(100, 0, 140, 30, 15, 15, 3, new float[][]  {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}});
}



int pos_x = 100;
int pos_y = 0;
int pos_z = 140;

void draw() {
  background(218, 218, 218);

  // Dibujo la cuadricula
  draw_cuadricula();

  //Girar cubos  
  cubos[0].rotar(PI/45, 0, 0);
  //cubos[1].rotar(0, -PI/90, 0);
  cubos[1].rotar_base(0, PI/90, 0);
  cubos[2].rotar(0, 0, -PI/180);
  cubos[8].mover(pos_x, pos_y, pos_z);
  cubos[3].rotar(PI/45, 0, -PI/45);
  //cubos[3].rotar_base(PI/45, 0, -PI/45);
  cubos[4].rotar(-PI/360, 0, 0);
  //cubos[5].rotar(PI/360, 0, 0);
  cubos[5].rotar_base(PI/360, 0, 0);
  //cubos[6].rotar(PI/45, 0, 0);
  cubos[6].rotar_base(PI/45, 0, 0);
  float[] post_4 = cubos[3].posicion();
  float[] post_punt_4 = cubos[3].posicion_punto(1, 2);
  cubos[7].mover(post_4[0]+post_punt_4[0], post_4[1]+post_punt_4[1], post_4[2]+post_punt_4[2]);
  cubos[7].rotar(PI/45, 0, -PI/45);

  if (cubos[1].posicion()[1] <= 150) {
    cubos[1].desplazar(0, 0.5, 0);
  } else {
    cubos[1].mover(0, 0, 0);
  }

  if (cubos[3].posicion()[2] <= 200) {
    cubos[3].desplazar(0, 0, 0.2);
  } else {
    cubos[3].mover(0, 0, 0);
  }

  if (cubos[4].posicion()[2] <= 160) {
    cubos[4].desplazar(0, 0, 0.3);
  } else {
    cubos[4].mover(0, 70, 0);
  }

  if (cubos[5].posicion()[1] <= 170) {
    //cubos[5].desplazar(0, 0.4, 0);
  } else {
    cubos[5].mover(0, 0, 140);
  }

  // Dibujar
  /*for(int i = 0; i < cubos_num; i++) {
   cubos[i].draw(scale, centro);
   }*/
  cubos[0].draw(scale, centro);
  cubos[1].draw(scale, centro);
  cubos[2].draw(scale, centro);
  cubos[3].draw(scale, centro);
  cubos[4].draw(scale, centro);
  cubos[5].draw(scale, centro);
  cubos[6].draw(scale, centro);
  cubos[7].draw(scale, centro);
  cubos[8].draw(scale, centro);

  if (realist_shadows) {
    cubos[5].draw_shadow2(cubos[8]);
    cubos[6].draw_shadow2(cubos[8]);
  } else {
    cubos[5].draw_shadow(cubos[8]);
    cubos[6].draw_shadow(cubos[8]);
  }

  // Dibujo los Ejes
  draw_axis();

  // Dibujo la informacion
  draw_info();

  // Controles
  controls();
}

void draw_info() {
  fill(255);
  textSize(16);
  text("Modos: 1(angulos), 2(longitudes), 3(base global), 4(girar)", 10, 50);
  text("Modo: "+ modo_realtime + ". Aumentar y disminuir Q/E, W/S, A/D", 10, 70);
  text("FPS: " + round(frameRate) +  " Escala: " + nf(scale, 0, 2) + " Objetos: " + cubos_num + " Vertices: " + vertex_num + " Aristas: " + edges_num, 10, 90);

  fill(130, 188, 255);
  //noStroke();
  rect(0, 0, 90, 25);
  textSize(16);
  fill(0, 55, 255);
  if (realist_shadows)
    text("Sombra: C", 4, 18);
  else
    text("Sombra: O", 4, 18);
}

boolean locked = false;
void mouseReleased() {
  locked = false;
}

void controls() {
  if (mousePressed) {
    if (overRect(0, 0, 90, 25)) {
      if (!locked)
        realist_shadows = !realist_shadows;
    } else {
      if (mouseButton == LEFT) {
        scale += scale * 0.05;
        if (scale > 1000)
          scale = 1000;
      } else if (mouseButton == RIGHT) {
        scale -= scale * 0.05;
      }
    }
    locked = true;
  }
  if (keyPressed) {
    switch (key) {
    case '1': 
      modo_realtime = 1;
      break;
    case '2': 
      modo_realtime = 2;
      break;
    case '3': 
      modo_realtime = 3;
      break;
    case '4': 
      modo_realtime = 4;
      break;
    case 'r': 
      alfa = grados2radianes(90); //90º
      beta = grados2radianes(210); //210º
      gamma = grados2radianes(330); //330º
      scale = 1;
      centro[0] = 640.0;
      centro[1] = 270.0;
      pos_x = 100;
      pos_y = 0;
      pos_z = 140;
      base_global[0][0] = 1;
      base_global[1][1] = 1;
      base_global[2][2] = 1;
      alfa_mod = 1;
      beta_mod = 1;
      gamma_mod = 1;
      break;
    case 'w':
      switch(modo_realtime) {
      case 1:
        alfa += PI/180;
        break;
      case 2:
        alfa_mod += 0.05;
        break;
      case 3:
        base_global[0][0] += 0.01;
        break;
      case 4:

        break;
      }
      break;
    case 's':
      switch(modo_realtime) {
      case 1:
        alfa -= PI/180;
        break;
      case 2:
        alfa_mod -= 0.05;
        break;
      case 3:
        base_global[0][0] -= 0.01;
        break;
      case 4:

        break;
      }
      break;
    case 'd':
      switch(modo_realtime) {
      case 1:
        beta += PI/180;
        break;
      case 2:
        beta_mod += 0.05;
        break;
      case 3:
        base_global[1][1] += 0.01;
        break;
      }
      break;
    case 'a':
      switch(modo_realtime) {
      case 1:
        beta -= PI/180;
        break;
      case 2:
        beta_mod -= 0.05;
        break;
      case 3:
        base_global[1][1] -= 0.01;
        break;
      }
      break;
    case 'q':
      switch(modo_realtime) {
      case 1:
        gamma -= PI/180;
        break;
      case 2:
        gamma_mod -= 0.05;
        break;
      case 3:
        base_global[2][2] -= 0.01;
        break;
      }
      break;
    case 'e':
      switch(modo_realtime) {
      case 1:
        gamma += PI/180;
        break;
      case 2:
        gamma_mod += 0.05;
        break;
      case 3:
        base_global[2][2] += 0.01;
        break;
      }
      break;
    case 'i':
      pos_x -= 2;
      break;
    case 'p':
      pos_x += 2;
      break;
    case 'o':
      pos_y -= 2;
      break;
    case 'l':
      pos_y += 2;
      break;
    case 'k':
      pos_z -= 2;
      break;
    case 'ñ':
      pos_z += 2;
      break;
    }

    switch (keyCode) {
    case UP:
      centro[1] += 4;
      break; 
    case RIGHT:
      centro[0] -= 4;
      break; 
    case LEFT:
      centro[0] += 4;
      break; 
    case DOWN:
      centro[1] -= 4;
      break;
    }
  }
}

void draw_cuadricula() {
  for (int i = -10; i <= 20; i++) {
    stroke(150, 150, 150); // Y (Anchura, izquierda)
    int iteracion = i * 20;
    float[] orig_t = {0, 0, 0};
    float[] proy_y_t = projection(new float[] {-ejes_log*base_global[1][0], -ejes_log*base_global[1][1], -ejes_log*base_global[1][2]+iteracion}, orig_t);
    float[] proy_z_t = projection(new float[] {-ejes_log*base_global[2][0], -ejes_log*base_global[2][1]+iteracion, -ejes_log*base_global[2][2]}, orig_t);
    float[] proy_y_t_2 = projection(new float[] {2*ejes_log*base_global[1][0], 2*ejes_log*base_global[1][1], 2*ejes_log*base_global[1][2]+iteracion}, orig_t);
    float[] proy_z_t_2 = projection(new float[] {2*ejes_log*base_global[2][0], 2*ejes_log*base_global[2][1]+iteracion, 2*ejes_log*base_global[2][2]}, orig_t);
    line(centro[0] + proy_y_t[0], centro[1] - proy_y_t[1], centro[0] + proy_y_t_2[0], centro[1] - proy_y_t_2[1]);
    line(centro[0] + proy_z_t[0], centro[1] - proy_z_t[1], centro[0] + proy_z_t_2[0], centro[1] - proy_z_t_2[1]);
  }
}

void draw_axis() {
  // Nuevo metodo, con la base global
  float[] orig = {0, 0, 0};
  float[] proy_x = projection(new float[] {ejes_log*base_global[0][0], ejes_log*base_global[0][1], ejes_log*base_global[0][2]}, orig);
  float[] proy_y = projection(new float[] {ejes_log*base_global[1][0], ejes_log*base_global[1][1], ejes_log*base_global[1][2]}, orig);
  float[] proy_z = projection(new float[] {ejes_log*base_global[2][0], ejes_log*base_global[2][1], ejes_log*base_global[2][2]}, orig);
  stroke(255, 0, 0); // X (Altura, arriba)
  line(centro[0], centro[1], centro[0] + proy_x[0], centro[1] - proy_x[1]);
  stroke(0, 255, 0); // Y (Anchura, izquierda)
  line(centro[0], centro[1], centro[0] + proy_y[0], centro[1] - proy_y[1]);
  stroke(0, 0, 255); // Z (Longitud, derecha)
  line(centro[0], centro[1], centro[0] + proy_z[0], centro[1] - proy_z[1]);
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

float grados2radianes(float grados) {
  return grados * (PI/180);
}

float[] projection(float[] obj, float[] obj_pos) {
  float[] obj_proy = new float[2];
  if (modo_proyeccion == 1) {
    obj_proy[0] = (((obj_pos[0] + obj[0])*cos(alfa)*alfa_mod + (obj_pos[1] + obj[1])*cos(beta)*beta_mod + (obj_pos[2] + obj[2])*cos(gamma)*gamma_mod)) * scale;
    obj_proy[1] = (((obj_pos[0] + obj[0])*sin(alfa)*alfa_mod + (obj_pos[1] + obj[1])*sin(beta)*beta_mod + (obj_pos[2] + obj[2])*sin(gamma)*gamma_mod)) * scale;
  } else if (modo_proyeccion == 2) {
  }
  return obj_proy;
}

// Funciones globales

float[] rota_x(float[] proy_old, float giro_x) {
  float x_t = proy_old[0];
  float y_t = proy_old[1];
  float z_t = proy_old[2];

  proy_old[0] = x_t;
  proy_old[1] = y_t*cos(giro_x) - z_t*sin(giro_x);
  proy_old[2] = y_t*sin(giro_x) + z_t*cos(giro_x);

  return proy_old;
}

float[] rota_y(float[] proy_old, float giro_y) {
  float x = proy_old[0];
  float y = proy_old[1];
  float z = proy_old[2];

  proy_old[0] = x*cos(giro_y) + z*sin(giro_y);
  proy_old[1] = y;
  proy_old[2] = x*-1*sin(giro_y) + z*cos(giro_y);

  return proy_old;
}

float[] rota_z(float[] proy_old, float giro_z) {
  float x = proy_old[0];
  float y = proy_old[1];
  float z = proy_old[2];

  proy_old[0] = x*cos(giro_z) - y*sin(giro_z);
  proy_old[1] = x*sin(giro_z) + y*cos(giro_z);
  proy_old[2] = z;

  return proy_old;
}

float[] shadow_projection(float[] obj, float[] foco_pos, float[] pos) {
  float[] obj_proy = new float[3];
  obj_proy[0] = (-pos[0] / foco_pos[0]) * obj[0];
  obj_proy[1] = ((obj[0] * (-foco_pos[1] / foco_pos[0])) + obj[1]);
  obj_proy[2] = ((obj[0] * (-foco_pos[2] / foco_pos[0])) + obj[2]);
  return obj_proy;
}

float[] shadow_projection2(float[] obj, float[] foco_pos, float[] pos) {
  float[] obj_proy = new float[3];
  float lamba = (-pos[0]-obj[0])/(obj[0] - foco_pos[0]);
  obj_proy[0] = -pos[0];
  obj_proy[1] = obj[1] + (obj[1] - foco_pos[1]) * lamba;
  obj_proy[2] = obj[2] + (obj[2] - foco_pos[2]) * lamba;
  return obj_proy;
}