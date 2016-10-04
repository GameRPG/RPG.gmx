///str_dash_state

movement = MOVE;

if (len == 0) //se estivermos parados corre isto, para dar dash para o sitio certo quando estamos parados
{ 
    dir = face*90;
}
len = spd * 4; //para o dash ser 4x mais rápido que o speed

// Get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);


// Move
phy_position_x += hspd;
phy_position_y += vspd;

// Create the dash effect
var dash = instance_create(x, y, obj_dash_effect); //criar o objecto
dash.sprite_index = sprite_index; //dá ao objecto um sprite
dash.image_index = image_index; //ter a mesma animação
