class Rectangle {
  float x;
  float y;
  float w;
  float h;
  
  Rectangle(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  boolean intersects(Rectangle other) {
    float left = x;
    float right = x + w;
    float top = y;
    float bottom = y + h;
    
    float oleft, oright,otop,obottom;
    oleft = other.x;
    oright = other.x + other.w;
    otop = other.y;
    obottom = other.y + other.h;
    
    return !(left >= oright || 
    right <= oleft || 
    top >= obottom ||
    bottom <= otop);
  }
}
