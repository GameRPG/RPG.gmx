///scr_move_axis()
var dir = point_direction(0, 0, xaxis, yaxis);
var hspd = lengthdir_x(spd, dir);
var vspd = lengthdir_y(spd, dir);
if (hspd != 0) //este if serve para corrigir bug de inimigo invisivel
{
    image_xscale = sign(hspd); //inimigo virar para o player // se for 1 fica virado para a direita e se ffor -1 para a esquerda
}
scr_get_face(dir);
movement = MOVE;
phy_position_x += hspd;
phy_position_y += vspd;

/*
phy_position_x += sign(obj_player.x - x) * spd; // sign return 1 ou -1 (assim só anda 1 unidade) (ex: se for 10 return 1 e se for -5 return -1)
phy_position_y += sign(obj_player.y - y) * spd;
*/
