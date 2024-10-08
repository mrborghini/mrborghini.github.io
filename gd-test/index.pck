GDPC                �                                                                         P   res://.godot/exported/133200997/export-5d2f649bfda0e984c5f95c948cc9f360-ui.scn  <      �      ����ٔ_%��3]��    T   res://.godot/exported/133200997/export-9002b8a12e02a130c5c065b7c15aab65-square.scn  p8      �      b\��2}�n~�3�vgǘ    P   res://.godot/exported/133200997/export-bcb0d2eb5949c52b6a65bfe9de3e985b-Main.scn�1      �      �S���{0Hȩ���    P   res://.godot/exported/133200997/export-f46c71a9b7f0892a5bf2bd9cf0943875-ball.scn      �      ����3O���HhN��    ,   res://.godot/global_script_class_cache.cfg  �C             ��Р�8���8~$}P�    D   res://.godot/imported/Ball.png-4e6e58f62343d577c3d22d908457c6a4.ctexp      �      �hѭ�\b���U�Ȇ    H   res://.godot/imported/Square.png-33cfe40d20ee8f261eff678aec0ba65b.ctex  �      ^       g���ϣ^2�Y��x2/    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�#            ：Qt�E�cO���       res://.godot/uid_cache.bin  `G      �       l@�����'D"�];�       res://Main.tscn.remap   @B      a       3 J�M�B�b��}�       res://Scripts/Ball.gd           �	      \�%���D��z�	��    $   res://Scripts/CameraController.gd   �	            ﶘ\�MNh��)��%       res://Scripts/FpsCounter.gd �      �       ��ڥ����`��b�       res://Scripts/Spawner.gdP            LӐ"c-t�׹qd�˥X        res://Sprites/Ball.png.import          �       �2���"\8�M�{7�         res://Sprites/Square.png.import @      �       3P7v��'���nܖX       res://ball.tscn.remap   �A      a       ;�#$�#ui�+�9KY)       res://icon.svg  �C      �      k����X3Y���f       res://icon.svg.import    1      �       ���z˛03��� �0��       res://project.binary0H      �      B���_DW^_kۼ� �       res://square.tscn.remap �B      c       ���\1�F�!FәA�V       res://ui.tscn.remap  C      _       �B��H��p����MW            extends RigidBody2D

@export var BounceForcePerPixel: float = 5.0
@export var MaxSpeed: float = 10.0

var _groundCast: RayCast2D
var _topCast: RayCast2D
var _leftCast: RayCast2D
var _rightCast: RayCast2D
var _topRightCast: RayCast2D
var _bottomRightCast: RayCast2D
var _bottomLeftCast: RayCast2D
var _topLeftCast: RayCast2D

func _ready():
	_groundCast = $GroundCast
	_topCast = $TopCast
	_leftCast = $LeftCast
	_rightCast = $RightCast
	_bottomLeftCast = $BottomLeftCast
	_topLeftCast = $TopLeftCast
	_topRightCast = $TopRightCast
	_bottomRightCast = $BottomRightCast

	MaxSpeed *= 1000
	BounceForcePerPixel *= 1000

func _physics_process(_delta: float):
	var currentRotation = rotation_degrees
	_groundCast.rotation_degrees = fmod((0 - currentRotation), 360)
	_topCast.rotation_degrees = fmod((180 - currentRotation), 360)
	_rightCast.rotation_degrees = fmod((270 - currentRotation), 360)
	_leftCast.rotation_degrees = fmod((90 - currentRotation), 360)
	_bottomLeftCast.rotation_degrees = fmod((45 - currentRotation), 360)
	_bottomRightCast.rotation_degrees = fmod(( - 45 - currentRotation), 360)
	_topRightCast.rotation_degrees = fmod((225 - currentRotation), 360)
	_topLeftCast.rotation_degrees = fmod(( - 225 - currentRotation), 360)

	if _groundCast.is_colliding():
		var force = Vector2(0, -BounceForcePerPixel)
		custom_force(force)
	elif _topCast.is_colliding():
		var force = Vector2(0, BounceForcePerPixel)
		custom_force(force)
	elif _leftCast.is_colliding():
		var force = Vector2(BounceForcePerPixel, 0)
		custom_force(force)
	elif _rightCast.is_colliding():
		var force = Vector2( - BounceForcePerPixel, 0)
		custom_force(force)
	elif _bottomLeftCast.is_colliding():
		var force = Vector2(BounceForcePerPixel, -BounceForcePerPixel)
		custom_force(force)
	elif _topLeftCast.is_colliding():
		var force = Vector2(BounceForcePerPixel, BounceForcePerPixel)
		custom_force(force)
	elif _topRightCast.is_colliding():
		var force = Vector2( - BounceForcePerPixel, BounceForcePerPixel)
		custom_force(force)
	elif _bottomRightCast.is_colliding():
		var force = Vector2( - BounceForcePerPixel, -BounceForcePerPixel)
		custom_force(force)

	limit_speed()

func custom_force(force: Vector2):
	# Apply the force to the ball
	apply_central_force(force)

func limit_speed():
	var velocity = linear_velocity
	var speed = velocity.length()

	if speed > MaxSpeed:
		velocity = velocity.normalized() * MaxSpeed
		linear_velocity = velocity
            extends Camera2D

var _currentResolution: Rect2

func _process(_delta):
	var resolution = get_viewport().get_visible_rect()

	if resolution.size != _currentResolution.size:
		if is_16x9(resolution.size):
			zoom = Vector2(resolution.size.x / 1152.0 * 2, resolution.size.y / 648.0 * 2)
		else:
			# Adjust the viewport to maintain a 16:9 aspect ratio.
			var targetWidth = resolution.size.y * (16.0 / 9.0)
			var targetHeight = resolution.size.x * (9.0 / 16.0)

			if targetWidth <= resolution.size.x:
				zoom = Vector2(targetWidth / 1152.0 * 2, resolution.size.y / 648.0 * 2)
			else:
				zoom = Vector2(resolution.size.x / 1152.0 * 2, targetHeight / 648.0 * 2)

		print(zoom)
		_currentResolution = resolution

func is_16x9(size: Vector2) -> bool:
	return abs(size.x / size.y - 16.0 / 9.0) < 0.01
 extends Label

var fps: int

func _process(_delta: float) -> void:
    fps = int(floor(Engine.get_frames_per_second()))
    text = "FPS: %d" % fps              extends Node2D

@export var Balls: int = 1
@export var BallScene: PackedScene

func _ready():
	Spawn()

func Spawn():
	for i in range(Balls):
		print("Spawned ball")
		var ball = BallScene.instantiate()
		ball.MaxSpeed = 10
		ball.BounceForcePerPixel = 5
		add_child(ball)
               GST2            ����                        x  RIFFp  WEBPVP8Ld  /���0��?��p�"ȶY�}��H�+dE��H�=a������s����OM�F�gD�Ѷmo�d��c�v�VP@	������؏JH@���#�{ξ���w䶍$��S�����ڶ�Ȗ0�|��A�0D�����Yg��OD�Ѷm����!����k�7v���%�5�;��+O������9�G����?Ͳޗ�����1<�b��9?J:ء��crY�v�4���<d�ѯ�Y�����ʙo`'Sc�u�߲8�͌�#�4n�I�}>�n�yH�}��8�7�spވ�?
sz{U���l怩�JZu���o�k���P?A$���ARL���j�Z�ԃ��R�c
lM��Z-��TK���KӾ�[��]M�4�����ײ�I�
����{��Ğ�[�N�|�&.S�Ǡ�K�u�%`��������Q#y�R'���e������Z��Nȼ���@j'<j(H#�Y�����Z
�f.�zJ��5������r����o
M]u��A;��YO��mC$g�iSy ��a :oxޔ@F���|�t�`ka�i��cXk6�֙ƀm=���A`S�bmi�ӧn�&�GK�����,����Ac��Ǳ~������:hF7���7OdG/�d�<���P�n���<�5���S�������6�:��O�Ǻ���vzx��%m�$U|�n��8x�����p��⣏���OϽn�s�O��U�Q�T�Q�T�Q�T���"��A<U|t�G�S)O����-��	t_8��'�}�/�@������T ��
4_X��+�|��/�@�(���\ ���^x��/�{r/�@����d ���^�Ab ��"�@��ɜ��OF%R]�ʄ���%���ˤG�w���V�(M]�/�}!�/����2u��U�$UHtQ�tW"����S5>:��	^T ��"��V�(��� �/Ɠ�b<�/Ɠ�b�+��I1�T7��h�@�&�X�],� �bI1�T�� ƭ�#c$i!F�b�+�S�G����F֨5LR�Huq+�C��)Fu��:݋�%%�Ӥթ^|��CL�K1�ӽ8lRb:]�1���G�<Dt�#:݋�'%�Ӧѩ^|4�����/�������1�^��N�ܵ)����3uz�{�2��[�S�$ioMi_�*Aw�}�R��[LS��L��t�Ч
����>U�D�-�)�K�C~�[TS������mqM����⧷�>U��-���&jm�Mi]����"�⧴�6e 7���҉
&��@�$~:���T��.<�id]x��آ�⧱E7e��8U�C7�u���!�OK����g2"9�.��*���� Ә��a�N�=�2$1���óP
nD�2*�x����)��a<����IN��Ѱ��)�d'{xVN�,&��M8���ԭ"����4���
�ٽ�UTRq7�95�Ri7�9u�Ȩd7�9�(�{v��M��T�_a�����!�"5�Ph�g�Z_�:Y���aՓ;ȲXq况$x�:i���Փ;X�ƛL���k�)Ă3��ڋJ,:��W!Ē3X��-dd�n`�
��
&��)�̢+x�uW ̒+X���24�7��'�B-8�ɬ�EP��ì���?���ߋɬ9�B-�E��LA�v�A@�OpAK�x�uWP�EW0�5WP��O�ML\Afv�� ��B����՝A%_L^�b���K�A&v��oopK��owP'ﷃ`xK�Yx�����Փ`x���^>���ؑi] ��GO�����[*��`xH�$���ؓY]6�f��U2����b��4<eS!��3<ǮL�2 ��G�u�Jf1I���M����-fQn��F�/s����������N��l�Q)�7gv������>O��d�n�tdRf�IxRf'{x�ia�.�Ȍ�3cv��cv��W3��h�P8$��u���^��ã%`��Q�/;�|
o� اZ��J��{x����zx���e���GK�U٥��&�x�.Йb�b?l�ا$�H�-P��2 ������l[�/p	z�W����aK�>��}jh*T��kKq�j���%UH���2���jKs�jK��R��������yu�r���E�������ٌ�pv�m�]4j�Ǉ�3�~]����}��}��}���2Ջ�JCQ��P�i�����MӽX�z�Zi)�4[�.M��1�Sti��T/^+ME�f�(b��*�4�D�I�ț���h����8.�[���l5�FQ�l�3����)Z�����**�w@zE�Wt0�E�;_��L�h`v�f�h`��f��`z��4�E~�_�7DS��uQGB� 'e&��f�oF����˫��xM����nj=��4y�i� r��_]�/�/+y1y��M�ח�y�)���L�$
@�( M� 3��$ �0�L� 1I�$ �8 L� /��$��@�K-I�$��H K"+��$��P�JB)I�$��P@y�"�`0�Er�O�����q�X��h��'�j�(�j����<J�=
�=�����������'�"�ᣄ�񣈫�Oϣ�8��8���[��Q��9Ѽ�E�&6w?LX����X0oc����:�,�7�X����o��ie�|֣�e�fɛY$�f����4t���2t4���x;���Z"o7z���;�,����0
�jQ�)B�Zoc�������%��zc�����t���;�F��a�^�u���`洇h�`�d�W؞�N�g�k��S)�d*uK&W%SE�+���ۦ0b�4��Wu�B�>���m���h�h�H�I<�e�49Y�>��8��H���b�jK����(��(�,�=7�i�����/��N�vOG�Z<z�Z�{��
�:J��*[���,��]cI�YR�a��k�%�eI����j��W1h_C--Rо�Z�bP`פ����*�tj�e^Ez0�*q{/�~i!�#u�ΥM�?J�8�9��MO�D�N��ἆ�������q��_����YN�8z�珓�Z�7�G�xf�����2o}i&Q���nedC�b���c�k=��&y�_�n���ڏC��b�Y��>�级[kH����+o[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://ql1hmda5nd5o"
path="res://.godot/imported/Ball.png-4e6e58f62343d577c3d22d908457c6a4.ctex"
metadata={
"vram_texture": false
}
 GST2            ����                        &   RIFF   WEBPVP8L   /� ���������    [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c4ry5h8jkeo11"
path="res://.godot/imported/Square.png-33cfe40d20ee8f261eff678aec0ba65b.ctex"
metadata={
"vram_texture": false
}
              RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    script 	   _bundled       Script    res://Scripts/Ball.gd ��������
   Texture2D    res://Sprites/Ball.png ��7��      local://CircleShape2D_7w41p �         local://PackedScene_35igk �         CircleShape2D             PackedScene          	         names "         Ball    script    BounceForcePerPixel    RigidBody2D    BallSprite    texture_filter    scale    texture 	   Sprite2D    CollisionShape2D    shape    GroundCast    target_position    collide_with_areas 
   RayCast2D 	   LeftCast 	   rotation    TopCast 
   RightCast    TopRightCast    BottomRightCast    BottomLeftCast    TopLeftCast    	   variants                       A      
   
ף<
ף<                   
         0A         ��?   �I@   �˖@   �S{@   �I�   �I?   �S{�      node_count             nodes     �   ��������       ����                                  ����                                 	   	   ����   
                        ����                                 ����                                       ����      	                                 ����      
                                 ����                                       ����                                       ����                                       ����                               conn_count              conns               node_paths              editable_instances              version             RSRC           GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�m�m۬�}�p,��5xi�d�M���)3��$�V������3���$G�$2#�Z��v{Z�lێ=W�~� �����d�vF���h���ڋ��F����1��ڶ�i�엵���bVff3/���Vff���Ҿ%���qd���m�J�}����t�"<�,���`B �m���]ILb�����Cp�F�D�=���c*��XA6���$
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
uid="uid://cucoyy04o3q2f"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Scripts/Spawner.gd ��������   PackedScene    res://ball.tscn ǘ6�0%x   Script "   res://Scripts/CameraController.gd ��������   PackedScene    res://square.tscn �G�#���    PackedScene    res://ui.tscn f!%��      local://PackedScene_e6vuc �         PackedScene          	         names "         Main    script    Balls 
   BallScene    Node2D 	   Camera2D    zoom    Ball 	   position    BounceForcePerPixel    Wall 	   modulate    scale    Wall2 	   rotation    Wall3    Wall4    UI    Square    	   variants                    
            
      @   @         
     ��  P�     �@            ���>���>���>  �?
         C
     B   @   ���>���>���>  �?
     ��       ��?
     �A   @
     �C    
         �         
     ��  #�
   ���>���>
     0�  �B   �@?
   �GA?  �?      node_count    	         nodes     s   ��������       ����                                        ����                           ���               	                  ���
                  	      
               ���                                             ���                                             ���                        
               ���                                 ���                                     conn_count              conns               node_paths              editable_instances              version             RSRC        RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled    
   Texture2D    res://Sprites/Square.png f����^      local://RectangleShape2D_pl5lg ^         local://PackedScene_lj4qr          RectangleShape2D             PackedScene          	         names "         Square    StaticBody2D    texture 	   Sprite2D    CollisionShape2D    visible    scale    shape    	   variants                        
   ��L?��L?                node_count             nodes        ��������       ����                       ����                            ����                               conn_count              conns               node_paths              editable_instances              version             RSRC    RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 
   fallbacks    font_names    font_italic    font_weight    font_stretch    antialiasing    generate_mipmaps    allow_system_fallback    force_autohinter    hinting    subpixel_positioning #   multichannel_signed_distance_field    msdf_pixel_range 
   msdf_size    oversampling    script 	   _bundled       Script    res://Scripts/FpsCounter.gd ��������      local://SystemFont_sctvp [         local://PackedScene_656r3 �         SystemFont                       PackedScene          	         names "         UI    Node2D    Control    layout_mode    anchors_preset    offset_right    offset_bottom    FpsCounter    theme_override_fonts/font $   theme_override_font_sizes/font_size    text    horizontal_alignment    vertical_alignment    script    Label    	   variants                        ��D    @ D     �B     �B             2         FPS:                        node_count             nodes     /   ��������       ����                      ����                                             ����	                           	      
         	      	      
             conn_count              conns               node_paths              editable_instances              version             RSRC  [remap]

path="res://.godot/exported/133200997/export-f46c71a9b7f0892a5bf2bd9cf0943875-ball.scn"
               [remap]

path="res://.godot/exported/133200997/export-bcb0d2eb5949c52b6a65bfe9de3e985b-Main.scn"
               [remap]

path="res://.godot/exported/133200997/export-9002b8a12e02a130c5c065b7c15aab65-square.scn"
             [remap]

path="res://.godot/exported/133200997/export-5d2f649bfda0e984c5f95c948cc9f360-ui.scn"
 list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 814 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H446l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z" fill="#478cbf"/><path d="M483 600c0 34 58 34 58 0v-86c0-34-58-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
              ��7��   res://Sprites/Ball.pngf����^   res://Sprites/Square.pngǘ6�0%x   res://ball.tscn{)���U   res://icon.svgA�7Ib   res://Main.tscn�G�#���    res://square.tscnf!%��   res://ui.tscnECFG      application/config/name         ball-sim   application/run/main_scene         res://Main.tscn    application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg  #   display/window/handheld/orientation            display/window/vsync/vsync_mode             dotnet/project/assembly_name         ball-sim4   rendering/textures/vram_compression/import_etc2_astc            