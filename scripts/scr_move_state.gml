///str_move_state
//image_index = 0; //Primeiro frame da animação

movement = MOVE;

if (obj_input.dash_key)
{
    var xdir = lengthdir_x(8, face*90); //distancia do sign
    var ydir = lengthdir_y(8, face*90);
    var speaker = instance_place(x + xdir, y + ydir, obj_speaker);
    if (speaker != noone)
    {
        // Talk to it 
        with (speaker)
        {
            if (!instance_exists(dialog))
            {
                dialog = instance_create(x+xoffset, y +yoffset, obj_dialog);
                dialog.text = text;
            }
            else
            {
                dialog.text_page++;
                dialog.text_count = 0;
                if (dialog.text_page > array_length_1d(dialog.text)-1)
                {
                    with (dialog)
                    {
                        instance_destroy();
                    }
                }
            }
        }  
    }
    else
    {
        if(obj_player_stats.stamina >= DASH_COST)
        {
            // Dash
            state = scr_dash_state;
            alarm[0] = room_speed/9; //Tempo do dash
            obj_player_stats.stamina -= DASH_COST;
            obj_player_stats.alarm[0] = room_speed; //delay antes de começar o regen
        }
    }
}

if (obj_input.attack_key)
{
    image_index = 0;
    state = scr_attack_state;
}

if (obj_input.spell_key)
{
    var p = instance_create(x, y, obj_projectile);
    var xforce = lengthdir_x(20, face*90); //20 é a velocidade do projectile
    var yforce = lengthdir_y(20, face*90);
    p.creator = id;
    
    switch (face)
    {
        case 0:
            p.sprite_index = spr_fireball_right;
            with (p)
            {
                physics_apply_impulse(x, y, xforce, yforce);
            }
            break;
        case 1:
            p.sprite_index = spr_fireball_up;
            with (p)
            {
                physics_apply_impulse(x, y, xforce, -20);
            }
            break;
        case 2:
            p.sprite_index = spr_fireball_left;
            with (p)
            {
                physics_apply_impulse(x, y, xforce, yforce);
            }
            break;
        case 3:
            p.sprite_index = spr_fireball_down;
            with (p)
            {
                physics_apply_impulse(x, y, xforce, yforce);
            }
            var xxx = x;
            var yyy = y;
            break;
        default:
            break;
    }
    
    /*with (p)
    {
        physics_apply_impulse(x, y, xforce, yforce);
    }*/
}

if (obj_input.swap_key)
{
    var nearest_weapon = instance_nearest(x, y, obj_weapon_item); //y+4?
    if (place_meeting(x, y+4, nearest_weapon))
    {
        scr_swap_weapons(nearest_weapon);
    }
}

// Get direction
dir = point_direction(0, 0, obj_input.xaxis, obj_input.yaxis);

// Get the lenght
if (obj_input.xaxis == 0 and obj_input.yaxis == 0)
{
    len = 0;
}
else
{
    len = spd;
    scr_get_face(dir);
}

// Get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);
/* Com este código o player anda mais rápido na diagonal
hspd = xaxis*spd;
vspd = yaxis*spd;
*/

// Move
phy_position_x += hspd;
phy_position_y += vspd;

// Control the sprite (animate)
image_speed = .2;
if (len == 0)
    image_index = 0;
