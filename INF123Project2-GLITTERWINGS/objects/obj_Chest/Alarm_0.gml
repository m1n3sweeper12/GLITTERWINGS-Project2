for(var i = 0; i < gold_count; i++) {
	instance_create_layer(x + 32, y + 32, "Instances", obj_Gold);
}
	
for(var i = 0; i < potion_count; i++) {
	instance_create_layer(x + 32, y + 32, "Instances", obj_HealthPotion);
}

instance_destroy(self);