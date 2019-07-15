uniform vec2 resolution;
uniform float time;



const float Pi = 3.14159;

float sinApprox(float x)
{
  x = Pi * floor(x / Pi);
  return (4.0 / Pi) * x - (4.0 / Pi) * x * abs(x);
}

float cosApprox(float x)
{
  return sinApprox(x * Pi);
}

void main()
{
  vec2 p = (2.0*gl_FragCoord.xy-resolution)/max(resolution.x,resolution.y);
  for(int i = 1; i < 50; i++)
  {
    vec2 newp = p;
    float speed = 100.0;
    newp.x += 0.6/float(i)*sin(float(i)*p.y+time/(300.0/speed)+0.3*float(i));
    newp.y += 0.6/float(i)*cos(float(i)*p.x+time/(300.0/speed)+0.3*float(i+10))-2.0;
    p = newp;
  }
  vec3 color = vec3(2.4 * tan(.6+p.y)+.5, 1.1-sin(3.2+p.y), .1+cos(p.x+p.y));
  gl_FragColor = vec4(color, 1.0);
}