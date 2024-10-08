GDPC                �	                                                                         P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn�(      �      �=����%�n�e���    X   res://.godot/exported/133200997/export-4db00948b6b15d7a71aa6950a7452af8-snake_game.scn  �C      �      ��h��KG��c�P�C    T   res://.godot/exported/133200997/export-56f0a837577a06ff966359b457b45e52-startup.scn p^      �	      ��@�2�1i������    \   res://.godot/exported/133200997/export-689057e2487f5ab6b2eb83acc15bbb6c-snake_segment.scn   PW      �      J#�7
�
��ao�*H    T   res://.godot/exported/133200997/export-b2e26e438636898eddb9e1b54f81a9ee-heart.scn   �	      O      BaP"�;;ީ'��_�    ,   res://.godot/global_script_class_cache.cfg  0j             ��Р�8���8~$}P�    D   res://.godot/imported/emi.png-18e8136eb56815047c547827ad8ae17f.ctex �      �       ,i��M�+�ȍ��h    H   res://.godot/imported/heart.png-46ac0108226a8969f121b451c7b38c9b.ctex   P      h      �4HT/�Z�>}�ޑ    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�            ：Qt�E�cO���    H   res://.godot/imported/snake.png-392902cc9306a7ce4eb91101ddc71c96.ctex   �B      ^       �4��'?U�[��׆H
       res://.godot/uid_cache.bin  n      O      *����
�gՕ���       res://CamZoom.gd        �      ���\��UPQ��� �       res://CurrentScene.gd   �      5       �.r;r0*������       res://FullScreenBG.gd   �      h      �Q��|��yeM%��       res://Heart.gd        9       �K�5�S��14�,EjW       res://SceneController.gd�,      �      ��ӱ���Ɨ�k^�       res://Snake.gd  p/            �*�		-I��O��C)�       res://emi.png.import�      �       �8�,D� 1�]�]�]�       res://heart.png.import  �      �       ���幐�λ����       res://heart.tscn.remap   h      b       =HLՉ�è>�\��I�       res://icon.svg  Pj      �      k����X3Y���f       res://icon.svg.import    (      �       ���|���w�p��u>       res://main.tscn.remap   ph      a       �J�Sw� ������       res://project.binary`o            {i�2������X       res://snake.png.import  �B      �       N������Z����V       res://snake_game.tscn.remap �h      g       Ї@�l� :ܜ�P�ǾX        res://snake_segment.tscn.remap  Pi      j       ���,р.���d	       res://startup.gd[      Q      �k���=���c�<       res://startup.tscn.remap�i      d       ��1��B+a�31;pf                extends Camera2D

var _currentResolution: Rect2 = Rect2()

@export var zoomMultiplier: float = 1.0

func _process(_delta: float) -> void:
	var resolution: Rect2 = get_viewport().get_visible_rect()

	if resolution.size != _currentResolution.size:
		if is_16x9(resolution.size):
			zoom = Vector2(resolution.size.x / 1152.0, resolution.size.y / 648.0) * zoomMultiplier
		else:
			# Adjust the viewport to maintain a 16:9 aspect ratio.
			var targetWidth: float = resolution.size.y * (16.0 / 9.0)
			var targetHeight: float = resolution.size.x * (9.0 / 16.0)

			if targetWidth <= resolution.size.x:
				zoom = Vector2(targetWidth / 1152.0, resolution.size.y / 648.0) * zoomMultiplier
			else:
				zoom = Vector2(resolution.size.x / 1152.0, targetHeight / 648.0) * zoomMultiplier

		print(zoom)
		_currentResolution = resolution

func is_16x9(size: Vector2) -> bool:
	return abs(size.x / size.y - 16.0 / 9.0) < 0.01
               extends Node

enum CurrentScene {
	STARTUP,
	GAME,
}
           GST2      0      ����                0        �   RIFF�   WEBPVP8L�   /� /@`"�w %Cd&
�K�})$@$@r�T'�?;�>����7�R#I�$��x2�A0Ri�}$���S��2������ӧ?���;��c`v��@�6��N��PS��P��T���bL�1�S5}��f8M٭����
���1��I��|q.��pҘ��	            [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c5vqhwevgkv8v"
path="res://.godot/imported/emi.png-18e8136eb56815047c547827ad8ae17f.ctex"
metadata={
"vram_texture": false
}
 extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var window_size := get_viewport_rect()
	self.size = Vector2(window_size.size.x, window_size.size.y)
        extends AnimatedSprite2D

func _ready() -> void:
	play()
       GST2      0     ����                0       0  RIFF(  WEBPVP8L  /�K Hrڟm�@��ˌ���g{��Wa	HRdEDhG�����ЊED�¤,
�me
a2ou2���qPU�6��h��*��SA�9��
��:0�$�������l�$�5Ï
"�? ���W���Xߋi闂t�P%��L����  ����/߁��u��w�-�!��_��{Y����-�/�����|��7���ﾧ���z�����	���᷅�z{��9!oNb��t��7'5�a�Q��nx>ߢ�7���Ϸ��E����瓸�m{�&         [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b68smkydx0ri1"
path="res://.godot/imported/heart.png-46ac0108226a8969f121b451c7b38c9b.ctex"
metadata={
"vram_texture": false
}
               RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script    atlas    region    margin    filter_clip    animations 	   _bundled    
   Texture2D    res://heart.png ��T�qF@   Script    res://Heart.gd ��������      local://RectangleShape2D_osqep �         local://AtlasTexture_cphqw �         local://AtlasTexture_vs5kt ,         local://AtlasTexture_nvdfn q         local://AtlasTexture_jt3lq �         local://AtlasTexture_yfqqq �         local://AtlasTexture_80eig @         local://AtlasTexture_u67ie �         local://AtlasTexture_y18c4 �         local://AtlasTexture_ckkfg          local://AtlasTexture_urjwg T         local://AtlasTexture_0l28o �         local://AtlasTexture_b0v3r �         local://AtlasTexture_ikaox #         local://AtlasTexture_fl57a h         local://AtlasTexture_y05g1 �         local://AtlasTexture_et84k �         local://AtlasTexture_5fjgk 7	         local://AtlasTexture_kgupf |	         local://AtlasTexture_mjko4 �	         local://SpriteFrames_il61a 
         local://PackedScene_rqj3c          RectangleShape2D             AtlasTexture                                 �A  �A         AtlasTexture                             �A  �A  �A         AtlasTexture                              B  �A  �A         AtlasTexture                             @B  �A  �A         AtlasTexture                             �B  �A  �A         AtlasTexture                             �B  �A  �A         AtlasTexture                             �B  �A  �A         AtlasTexture                             �B  �A  �A         AtlasTexture                              C  �A  �A         AtlasTexture                             C  �A  �A         AtlasTexture                              C  �A  �A         AtlasTexture                             0C  �A  �A         AtlasTexture                             @C  �A  �A         AtlasTexture                             PC  �A  �A         AtlasTexture                             `C  �A  �A         AtlasTexture                             pC  �A  �A         AtlasTexture                             �C  �A  �A         AtlasTexture                             �C  �A  �A         AtlasTexture                             �C  �A  �A         SpriteFrames    	                     name ,      default       speed      �@      loop             frames                   texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture       	      	   duration      �?            texture       
      	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?         PackedScene    
      	         names "         StaticBody2D    CollisionShape2D    shape    Heart    texture_filter    sprite_frames    script    AnimatedSprite2D    	   variants                                               node_count             nodes        ��������        ����                      ����                            ����                               conn_count              conns               node_paths              editable_instances              version             RSRC GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�m�m۬�}�p,��5xi�d�M���)3��$�V������3���$G�$2#�Z��v{Z�lێ=W�~� �����d�vF���h���ڋ��F����1��ڶ�i�엵���bVff3/���Vff���Ҿ%���qd���m�J�}����t�"<�,���`B �m���]ILb�����Cp�F�D�=���c*��XA6���$
2#�E.@$���A.T�p )��#L��;Ev9	Б )��D)�f(qA�r�3A�,#ѐA6��npy:<ƨ�Ӱ����dK���|��m�v�N�>��n�e�(�	>����ٍ!x��y�:��9��4�C���#�Ka���9�i]9m��h�{Bb�k@�t��:s����¼@>&�r� ��w�GA����ը>�l�;��:�
�wT���]�i]zݥ~@o��>l�|�2�Ż}�:�S�;5�-�¸ߥW�vi�OA�x��Wwk�f��{�+�h�i�
4�˰^91��z�8�(��yޔ7֛�;0����^en2�2i�s�)3�E�f��Lt�YZ���f-�[u2}��^q����P��r��v��
�Dd��ݷ@��&���F2�%�XZ!�5�.s�:�!�Њ�Ǝ��(��e!m��E$IQ�=VX'�E1oܪì�v��47�Fы�K챂D�Z�#[1-�7�Js��!�W.3׹p���R�R�Ctb������y��lT ��Z�4�729f�Ј)w��T0Ĕ�ix�\�b�9�<%�#Ɩs�Z�O�mjX �qZ0W����E�Y�ڨD!�$G�v����BJ�f|pq8��5�g�o��9�l�?���Q˝+U�	>�7�K��z�t����n�H�+��FbQ9���3g-UCv���-�n�*���E��A�҂
�Dʶ� ��WA�d�j��+�5�Ȓ���"���n�U��^�����$G��WX+\^�"�h.���M�3�e.
����MX�K,�Jfѕ*N�^�o2��:ՙ�#o�e.
��p�"<W22ENd�4B�V4x0=حZ�y����\^�J��dg��_4�oW�d�ĭ:Q��7c�ڡ��
A>��E�q�e-��2�=Ϲkh���*���jh�?4�QK��y@'�����zu;<-��|�����Y٠m|�+ۡII+^���L5j+�QK]����I �y��[�����(}�*>+���$��A3�EPg�K{��_;�v�K@���U��� gO��g��F� ���gW� �#J$��U~��-��u���������N�@���2@1��Vs���Ŷ`����Dd$R�":$ x��@�t���+D�}� \F�|��h��>�B�����B#�*6��  ��:���< ���=�P!���G@0��a��N�D�'hX�׀ "5#�l"j߸��n������w@ K�@A3�c s`\���J2�@#�_ 8�����I1�&��EN � 3T�����MEp9N�@�B���?ϓb�C��� � ��+�����N-s�M�  ��k���yA 7 �%@��&��c��� �4�{� � �����"(�ԗ�� �t�!"��TJN�2�O~� fB�R3?�������`��@�f!zD��%|��Z��ʈX��Ǐ�^�b��#5� }ى`�u�S6�F�"'U�JB/!5�>ԫ�������/��;	��O�!z����@�/�'�F�D"#��h�a �׆\-������ Xf  @ �q�`��鎊��M��T�� ���0���}�x^�����.�s�l�>�.�O��J�d/F�ě|+^�3�BS����>2S����L�2ޣm�=�Έ���[��6>���TъÞ.<m�3^iжC���D5�抺�����wO"F�Qv�ږ�Po͕ʾ��"��B��כS�p�
��E1e�������*c�������v���%'ž��&=�Y�ް>1�/E������}�_��#��|������ФT7׉����u������>����0����緗?47�j�b^�7�ě�5�7�����|t�H�Ե�1#�~��>�̮�|/y�,ol�|o.��QJ rmϘO���:��n�ϯ�1�Z��ը�u9�A������Yg��a�\���x���l���(����L��a��q��%`�O6~1�9���d�O{�Vd��	��r\�՜Yd$�,�P'�~�|Z!�v{�N�`���T����3?DwD��X3l �����*����7l�h����	;�ߚ�;h���i�0�6	>��-�/�&}% %��8���=+��N�1�Ye��宠p�kb_����$P�i�5�]��:��Wb�����������ě|��[3l����`��# -���KQ�W�O��eǛ�"�7�Ƭ�љ�WZ�:|���є9�Y5�m7�����o������F^ߋ������������������Р��Ze�>�������������?H^����&=����~�?ڭ�>���Np�3��~���J�5jk�5!ˀ�"�aM��Z%�-,�QU⃳����m����:�#��������<�o�����ۇ���ˇ/�u�S9��������ٲG}��?~<�]��?>��u��9��_7=}�����~����jN���2�%>�K�C�T���"������Ģ~$�Cc�J�I�s�? wڻU���ə��KJ7����+U%��$x�6
�$0�T����E45������G���U7�3��Z��󴘶�L�������^	dW{q����d�lQ-��u.�:{�������Q��_'�X*�e�:�7��.1�#���(� �k����E�Q��=�	�:e[����u��	�*�PF%*"+B��QKc˪�:Y��ـĘ��ʴ�b�1�������\w����n���l镲��l��i#����!WĶ��L}rեm|�{�\�<mۇ�B�HQ���m�����x�a�j9.�cRD�@��fi9O�.e�@�+�4�<�������v4�[���#bD�j��W����֢4�[>.�c�1-�R�����N�v��[�O�>��v�e�66$����P
�HQ��9���r�	5FO� �<���1f����kH���e�;����ˆB�1C���j@��qdK|
����4ŧ�f�Q��+�     [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bbl6mijtviw3"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://SceneController.gd ��������   PackedScene    res://snake_game.tscn A�v���K   PackedScene    res://startup.tscn �{-.r_      local://PackedScene_ubcjo q         PackedScene          	         names "         Main    script    snake_game    Node2D    Startup    anchors_preset    anchor_left    anchor_top    anchor_right    anchor_bottom    game_load_delay_ms    	   variants                                               ?    `�F      node_count             nodes        ��������       ����                            ���                                 	      
                conn_count              conns               node_paths              editable_instances              version             RSRC  extends Node2D

enum State { STARTUP, GAME }

var startup_scene: Control
var selected_state: State = State.STARTUP

@export var snake_game: PackedScene

var last_state: State

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startup_scene = $Startup
	last_state = selected_state
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_instance_valid(startup_scene) and startup_scene.done and selected_state == State.STARTUP:
		selected_state = State.GAME
		startup_scene.queue_free()
		print("Changed to GAME scene")
		var snake = snake_game.instantiate()
		add_child(snake)
		
	last_state = selected_state
      extends Node

@export var snake_segment_scene: PackedScene
@export var food_scene: PackedScene

var snake_segments: Array[Node2D]
var rng = RandomNumberGenerator.new()

enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT,
}

@export var food_range = Vector2(256, 144)
@export var time_per_step = 1.0
@export var move_amount = 16 # The number of pixels to move per step (16 pixels)
var time_accumulator = 0.0 # Accumulate time to move in steps

@export var current_direction: Direction

var food: StaticBody2D

var swipe_start_position: Vector2 = Vector2.ZERO
var swipe_end_position: Vector2 = Vector2.ZERO
var is_swiping: bool = false
var food_available = false

@export var top_left_bound: Vector2 = Vector2(-19, -11)
@export var bottom_right_bound: Vector2 = Vector2(16, 8)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Started snake")
	for i in range(0, 2):
		add_snake_segment()
	add_food()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_direction(delta)
	check_for_food_collision()
	check_for_body_collision()
	check_for_wall_collision()

func handle_direction(delta: float):
	time_accumulator += delta
	
	if time_accumulator >= time_per_step:
		time_accumulator -= time_per_step # Reset accumulator
		
		# Update the position of the segments
		for i in range(len(snake_segments) - 1, 0, -1):
			snake_segments[i].position = snake_segments[i - 1].position
		
		match current_direction:
			Direction.UP:
				snake_segments[0].position.y -= move_amount
			Direction.DOWN:
				snake_segments[0].position.y += move_amount
			Direction.LEFT:
				snake_segments[0].position.x -= move_amount
			Direction.RIGHT:
				snake_segments[0].position.x += move_amount

func _input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		if event.is_pressed():
			swipe_start_position = event.position
			is_swiping = true
		else:
			if is_swiping:
				swipe_end_position = event.position
				_detect_swipe()
				is_swiping = false

	elif event is InputEventScreenDrag or event is InputEventMouseMotion:
		if is_swiping:
			swipe_end_position = event.position
			

	if Input.is_action_just_pressed("up"):
		swipe_start_position = Vector2.DOWN
		swipe_end_position = Vector2.UP
		_detect_swipe()
	if Input.is_action_just_pressed("down"):
		swipe_start_position = Vector2.UP
		swipe_end_position = Vector2.DOWN
		_detect_swipe()
	if Input.is_action_just_pressed("left"):
		swipe_start_position = Vector2.RIGHT
		swipe_end_position = Vector2.LEFT
		_detect_swipe()
	if Input.is_action_just_pressed("right"):
		swipe_start_position = Vector2.LEFT
		swipe_end_position = Vector2.RIGHT
		_detect_swipe()
	
			
func check_for_food_collision():
	if food.position == snake_segments[0].position:
		food.queue_free()
		food_available = false
		add_snake_segment()
		add_food()

func _detect_swipe():
	var delta: Vector2 = swipe_end_position - swipe_start_position
	var abs_delta: Vector2 = delta.abs()
	
	if abs_delta.x > abs_delta.y:
		if delta.x > 0 and current_direction != Direction.LEFT:
			current_direction = Direction.RIGHT
		elif delta.x < 0 and current_direction != Direction.RIGHT:
			current_direction = Direction.LEFT
	else:
		if delta.y > 0 and current_direction != Direction.UP:
			current_direction = Direction.DOWN
		elif delta.y < 0 and current_direction != Direction.DOWN:
			current_direction = Direction.UP
	
func add_snake_segment():
	var segment = snake_segment_scene.instantiate()
	if len(snake_segments) > 0:
		segment.position = snake_segments[len(snake_segments) - 1].position
		
	snake_segments.append(segment)
	add_child(segment)
	
func check_for_body_collision():
	for i in range(2, len(snake_segments)):
		if snake_segments[0].position == snake_segments[i].position:
			reset_game()
			break

func check_for_wall_collision():
	var head_pos = snake_segments[0].position
	
	if head_pos.x < top_left_bound.x or head_pos.x > bottom_right_bound.x or head_pos.y < top_left_bound.y or head_pos.y > bottom_right_bound.y:
		reset_game()


	
func reset_game():
	for segment in snake_segments:
		segment.queue_free()
	
	snake_segments = []
	for i in range(0, 2):
		add_snake_segment()
	
func generate_random_pos():
	var x = randi_range(-food_range.x, food_range.x)
	var y = randi_range(-food_range.y, food_range.y)
	
	x = round_to_nearest_16(x)
	y = round_to_nearest_16(y)
	
	return Vector2(x, y)

func add_food():
	var new_food = food_scene.instantiate()
	
	while not food_available:
		var unavailable = false
		new_food.position = generate_random_pos()
		
		for segment in snake_segments:
			if new_food.position == segment.position:
				unavailable = true
				break
		
		if not unavailable:
			add_child(new_food)
			food_available = true
			food = new_food
	
func round_to_nearest_16(number: int) -> int:
	return int(round(float(number) / 16.0) * 16)
  GST2            ����                        &   RIFF   WEBPVP8L   /� Pߪ�����    [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://ci4htmcx4d28j"
path="res://.godot/imported/snake.png-392902cc9306a7ce4eb91101ddc71c96.ctex"
metadata={
"vram_texture": false
}
               RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    texture    margins    separation    texture_region_size    use_texture_padding    0:0/0 &   0:0/0/physics_layer_0/linear_velocity '   0:0/0/physics_layer_0/angular_velocity    0:0/0/script    0:1/0 &   0:1/0/physics_layer_0/linear_velocity '   0:1/0/physics_layer_0/angular_velocity    0:1/0/script    0:2/0 &   0:2/0/physics_layer_0/linear_velocity '   0:2/0/physics_layer_0/angular_velocity    0:2/0/script    script    tile_shape    tile_layout    tile_offset_axis 
   tile_size    uv_clipping     physics_layer_0/collision_layer 
   sources/0    tile_proxies/source_level    tile_proxies/coords_level    tile_proxies/alternative_level 	   _bundled       Script    res://Snake.gd ��������   PackedScene    res://snake_segment.tscn ��(�n��F   PackedScene    res://heart.tscn ���[�6BE   Script    res://CamZoom.gd ��������
   Texture2D    res://emi.png ����`   !   local://TileSetAtlasSource_xwfgr �         local://TileSet_r6tf5 T         local://PackedScene_ox4w5 �         TileSetAtlasSource                             
           	          
                   
                                        
                                    TileSet                                   PackedScene          	         names "      
   SnakeGame    script    snake_segment_scene    food_scene    time_per_step    top_left_bound    bottom_right_bound    Node2D 	   Camera2D 	   position    zoom    zoomMultiplier    TileMap    texture_filter 	   tile_set    format    layer_0/tile_data    	   variants                                   )   333333�?
     ��  �
     �C  C
          @
      @   @         )   ������ @                         �  ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����         ��        ��        ��        ��        ��        ��        ��        ��        ��       	 ��       
 ��        ��        ��        ��        ��        ��        ��        ��        ��        ��        ��        ��        ��        ��        ��        ��        ��                                                                                          	        ����       ����       ����       ����       ����       ����       ����       ����       ����       ��         ��        ��        ��        ��        ��        ��        ��         	         	         	         	         	         	        
 	        	 	         	         	         	         	         	         	         	         	          	        ��	        ��	        ��	        ��	        ��	        ��	        ��	        ��	        ��	        ��	        ��	        ��	        ��	        ��	        ��	        ��	        ��	        ��	        ��        ��
        ��
        ��
        ��
        ��
        ��
        ��
        ��
        ��
        ��
        ��
        ��
        ��
        ��
        ��
        ��
        ��
        ��
          
         
         
         
         
         
         
         
         
        	 
        
 
         
         
         
         
         
         
         
         ��        ��        ��        ��        ��        ��        ��       
 ��       	 ��        ��        ��        ��        ��        ��        ��        ��        ��         ��       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ����       ��         ��        ��        ��        ��        ��        ��        ��        ��        ��	        ��
         
         	                                                                                           ��        ��        ��        ��        ��        ��        ��        ��        ��        ��        ��             node_count             nodes     3   ��������       ����                                                          ����   	      
               	                     ����      
   	                                  conn_count              conns               node_paths              editable_instances              version             RSRC   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled    
   Texture2D    res://snake.png ur����J      local://RectangleShape2D_w4wmu U         local://PackedScene_y1ixj �         RectangleShape2D       
     `A  `A         PackedScene          	         names "         SnakeSegment    Node2D 	   Sprite2D    texture_filter    texture    StaticBody2D    CollisionShape2D    shape    	   variants                                       node_count             nodes     "   ��������       ����                      ����                                  ����                     ����                   conn_count              conns               node_paths              editable_instances              version             RSRC       extends Control

@export var done: bool = false
@export var text_speed_ms: float = 0.1
@export var game_load_delay_ms: float = 10000

var label: RichTextLabel

@export_multiline var message = "You can’t directly change the label’s font size. You need to import a costum font first. After that, you can change the font size, in the editor. you can scale up the whole label/button, in Rect option."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label = $RichTextLabel
	if not done:
		self.show_text()

func show_text() -> void:
	label.text = ""
	var letters = message.split("")
	
	for letter in letters:
		label.text += letter
		print(label.text)
		await get_tree().create_timer(text_speed_ms / 1000).timeout
	await get_tree().create_timer(game_load_delay_ms / 1000).timeout
	done = true
	print("Done")
               RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 
   fallbacks    font_names    font_italic    font_weight    font_stretch    antialiasing    generate_mipmaps    allow_system_fallback    force_autohinter    hinting    subpixel_positioning #   multichannel_signed_distance_field    msdf_pixel_range 
   msdf_size    oversampling    script    default_base_scale    default_font    default_font_size 	   _bundled       Script    res://startup.gd ��������   Script    res://FullScreenBG.gd ��������   PackedScene    res://heart.tscn ���[�6BE      local://SystemFont_s0hgp          local://Theme_ovb54 /         local://PackedScene_7ltdg a         SystemFont                       Theme                       (            PackedScene          	         names "         Startup    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    theme    script    text_speed_ms    message    Control 
   ColorRect    color    RichTextLabel    offset_right    offset_bottom    text    scroll_active    Heart 	   position    scale    	   variants                        �?                              �A   �  I'm the luckiest boyfriend ever baby ❤I can't believe it's been 5 months already. I just feel so lucky to have such an amazing girlfriend. I feel very loved and cared about <3. I appreciate you so much! You're always so cute to me and I don't know what I would do without you. I love you so much ❤

I really love the way you make me feel when we talk. I just can't express with words how you make me feel, but it's always so nice to talk to you :D                        �?            ����     �D     "D   	   template                 
     �D  D
     �@  �@      node_count             nodes     T   ��������       ����
                                                    	      
                        ����                                          	      
                     ����                                                               ���                               conn_count              conns               node_paths              editable_instances              version             RSRC   [remap]

path="res://.godot/exported/133200997/export-b2e26e438636898eddb9e1b54f81a9ee-heart.scn"
              [remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
               [remap]

path="res://.godot/exported/133200997/export-4db00948b6b15d7a71aa6950a7452af8-snake_game.scn"
         [remap]

path="res://.godot/exported/133200997/export-689057e2487f5ab6b2eb83acc15bbb6c-snake_segment.scn"
      [remap]

path="res://.godot/exported/133200997/export-56f0a837577a06ff966359b457b45e52-startup.scn"
            list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 814 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H446l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z" fill="#478cbf"/><path d="M483 600c0 34 58 34 58 0v-86c0-34-58-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
              �?�_�%X   res://emi.apple-touch-icon.pngk��4��   res://emi.icon.png����`   res://emi.png��T�qF@   res://heart.png���[�6BE   res://heart.tscn�P��KD   res://icon.svgu�T��.k   res://main.tscnur����J   res://snake.pngA�v���K   res://snake_game.tscn��(�n��F   res://snake_segment.tscn�{-.r_   res://startup.tscn ECFG      application/config/name         emi    application/run/main_scene         res://main.tscn    application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg  +   debug/gdscript/warnings/unassigned_variable            display/window/vsync/vsync_mode             input/up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W   	   key_label             unicode    w      echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device     ����   axis      
   axis_value       ��   script            InputEventJoypadButton        resource_local_to_scene           resource_name             device     ����   button_index         pressure          pressed          script      
   input/down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S   	   key_label             unicode    s      echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device     ����   button_index         pressure          pressed          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device     ����   axis      
   axis_value       �?   script      
   input/left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   A   	   key_label             unicode    a      echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device     ����   axis       
   axis_value       ��   script            InputEventJoypadButton        resource_local_to_scene           resource_name             device     ����   button_index         pressure          pressed          script         input/right�              deadzone      ?      events              InputEventJoypadMotion        resource_local_to_scene           resource_name             device     ����   axis       
   axis_value       �?   script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   D   	   key_label             unicode    d      echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device     ����   button_index         pressure          pressed          script      #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility4   rendering/textures/vram_compression/import_etc2_astc                        