var dgrid = ds_depthgrid;
var inst_num = instance_number(par_depthobject);
ds_grid_resize(dgrid, 2, inst_num);

// Fill grid
for (var i = 0; i < inst_num; i++)
{
    var inst = instance_find(par_depthobject, i);
    dgrid[# 0, i] = inst;
    dgrid[# 1, i] = inst.y + inst.z;
}

// Sort by depth value
ds_grid_sort(dgrid, 1, true);

// Draw in order
for (var i = 0; i < inst_num; i++)
{
    var inst = dgrid[# 0, i];

    with (inst)
    {
       draw_sprite(sprite_index, image_index, x, y + z);
    }
}