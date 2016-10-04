///scr_swap_weapons(new_weapon)
var new_weapon = argument0;
var temp = weapon_sprite; //weapon que temos
weapon_sprite = new_weapon.sprite_index;
new_weapon.sprite_index = temp;

// Mudar stats
switch(sprite_get_name(temp))
{
    case "spr_sword":
        break;
        
    case "spr_axe":
        obj_player_stats.attack -= 5;
        break;
        
    default:
        break;
}

switch(sprite_get_name(weapon_sprite))
{
    case "spr_sword":
        break;
        
    case "spr_axe":
        obj_player_stats.attack += 5;
        break;
        
    default:
        break;
}
