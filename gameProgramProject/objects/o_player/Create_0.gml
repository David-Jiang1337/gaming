//keybinds

//stats

movespeed = 5;

nums = ds_list_create();
ds_list_add(nums, 6,1,2,7,2,3,4,6,7,10,2);

sort(nums,0,ds_list_size(nums)-1);

var kek = "";
for(var i=0; i<ds_list_size(nums)-1; i++){
	show_debug_message(ds_list_find_value(nums, i));
}
