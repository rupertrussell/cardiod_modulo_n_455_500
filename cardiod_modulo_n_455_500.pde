
// cardiod_modulo_n_455_500
// How to calculate points on a circle
// Based on code from http://www.mathopenref.com/coordcirclealgorithm...
/* 
There are 2 * PI Radians in a circle
If we have a circle of radius 20 with its center at the origin, the circle can be described by the pair of equations
x = 20 cos(t) 
y = 20 sin(t)
also pased on https://www.youtube.com/watch?v=qhbuKbxJsk8&amp... 
Times Tables, Mandelbrot and the Heart of Mathematics
by Burkard Polster and Giuseppe Geracitano
see: http://codepen.io/hippiefuturist/full/NAvqgk/

Artwork on Redbubble at: https://www.redbubble.com/shop/ap/24619400
Code on Github at: https://github.com/rupertrussell/cardiod_modulo_n_455_500

*/
float scale = 0.1; 
float w = 9411 * scale ; // width of image
float h = 9411 * scale; // height of image
float n = 500; // Modulus/Points
float m = 455; // Multiplication Factor
void setup() {
background(255); 
// size(9411, 9411); // full scale for Redbubble
size(941, 941); // full scale for Redbubble
smooth();
noLoop();
}
void draw() {
float radius = w / 2 - 100;
cardioid(n, radius); // number of points on circle, radius of circle
// draw the cardiod lines
for (int i = 0; i < n; i = i+1) {
connectPoints(n, radius, i, i * m);
}
// draw the outline circle
noFill();
strokeWeight(35 * scale);
ellipse(width/2, height /2, radius * 2, radius * 2);
save("cardiod_modulo_n_455_500x941.png");
// exit();
}
void cardioid(float n, float r) {
// draws n points on a circle
double step = 2 * PI/n; 
float offset = w / 2;
// draw n points on circle
for (float theta=0; theta < 2 * PI; theta += step) {
float x = offset + r * cos(theta);
float y = offset - r * sin(theta); 
stroke(255, 0, 0);
// point(x, y);
}
}
void connectPoints(float n, float r, float firstPoint, float secondPoint) {
// Connect two points on a circle
float step = 2 * PI/n; 
float offset = w / 2;
// draw n points on circle
float x1 = offset + r * cos(firstPoint * step);
float y1 = offset - r * sin(firstPoint * step);
float x2 = offset + r * cos(secondPoint * step);
float y2 = offset -r * sin(secondPoint * step);
strokeWeight(15 * scale);
stroke(0, 0, 0);
line(x1, y1, x2, y2);
}
