FasdUAS 1.101.10   ��   ��    k             l     ��  ��    $ 	Cycle through specified state     � 	 	 < 	 C y c l e   t h r o u g h   s p e c i f i e d   s t a t e   
  
 l     ��  ��         v0.2     �            v 0 . 2      l     ��  ��    * $ 	send feedback to sandro@sandro.org     �   H   	 s e n d   f e e d b a c k   t o   s a n d r o @ s a n d r o . o r g      l     ��  ��     	use at your own peril      �   . 	 u s e   a t   y o u r   o w n   p e r i l        l     ��������  ��  ��        l     ��  ��     	 changes:     �      c h a n g e s :     !   l     �� " #��   " J D 0.3: removed activate command which all of a sudden no longer works    # � $ $ �   0 . 3 :   r e m o v e d   a c t i v a t e   c o m m a n d   w h i c h   a l l   o f   a   s u d d e n   n o   l o n g e r   w o r k s !  % & % l     �� ' (��   ' P J 0.2: removed flagged as a possible state now that it's in its own filter.    ( � ) ) �   0 . 2 :   r e m o v e d   f l a g g e d   a s   a   p o s s i b l e   s t a t e   n o w   t h a t   i t ' s   i n   i t s   o w n   f i l t e r . &  * + * l     ��������  ��  ��   +  , - , l     �� . /��   . #  bring OmniFocus to the front    / � 0 0 :   b r i n g   O m n i F o c u s   t o   t h e   f r o n t -  1�� 1 l    � 2���� 2 O     � 3 4 3 k    � 5 5  6 7 6 l   ��������  ��  ��   7  8 9 8 l   �� : ;��   :  activate    ; � < <  a c t i v a t e 9  = > = r     ? @ ? n     A B A 4    �� C
�� 
FCdw C m   	 
����  B 4    �� D
�� 
docu D m    ����  @ o      ���� 0 thedoc theDoc >  E F E l   ��������  ��  ��   F  G H G l   �� I J��   I %  get and set needed task states    J � K K >   g e t   a n d   s e t   n e e d e d   t a s k   s t a t e s H  L M L l   �� N O��   N 2 ,a list of context names you want selected.      O � P P X a   l i s t   o f   c o n t e x t   n a m e s   y o u   w a n t   s e l e c t e d .     M  Q R Q l   �� S T��   S ^ X possible options, any combination of:"all","next", "available", "incomplete","complete"    T � U U �   p o s s i b l e   o p t i o n s ,   a n y   c o m b i n a t i o n   o f : " a l l " , " n e x t " ,   " a v a i l a b l e " ,   " i n c o m p l e t e " , " c o m p l e t e " R  V W V l   �� X Y��   X � � this script will cycle through these states in the order that they are displayed below, so feel free to re-order them to your liking    Y � Z Z
   t h i s   s c r i p t   w i l l   c y c l e   t h r o u g h   t h e s e   s t a t e s   i n   t h e   o r d e r   t h a t   t h e y   a r e   d i s p l a y e d   b e l o w ,   s o   f e e l   f r e e   t o   r e - o r d e r   t h e m   t o   y o u r   l i k i n g W  [ \ [ l   �� ] ^��   ] @ : BTW: incomplete = remaining if it wasn't apparent already    ^ � _ _ t   B T W :   i n c o m p l e t e   =   r e m a i n i n g   i f   i t   w a s n ' t   a p p a r e n t   a l r e a d y \  ` a ` r     b c b J     d d  e f e m     g g � h h  a v a i l a b l e f  i�� i m     j j � k k  i n c o m p l e t e��   c o      ���� *0 availabletaskstates availableTaskStates a  l m l l   ��������  ��  ��   m  n o n l   �� p q��   p   get current state    q � r r $   g e t   c u r r e n t   s t a t e o  s t s r     u v u c     w x w n     y z y 1    ��
�� 
FC?i z l    {���� { n     | } | 1    ��
�� 
FCcn } o    ���� 0 thedoc theDoc��  ��   x m    ��
�� 
ctxt v o      ���� $0 currenttaskstate currentTaskState t  ~  ~ l   ��������  ��  ��     � � � l   �� � ���   �   init next state    � � � �     i n i t   n e x t   s t a t e �  � � � r    " � � � m      � � � � �   � o      ���� 0 nexttaskstate nextTaskState �  � � � l  # #��������  ��  ��   �  � � � l  # #�� � ���   � D > get count of total number of available task states in "array"    � � � � |   g e t   c o u n t   o f   t o t a l   n u m b e r   o f   a v a i l a b l e   t a s k   s t a t e s   i n   " a r r a y " �  � � � r   # * � � � I  # (�� ���
�� .corecnte****       **** � l  # $ ����� � o   # $���� *0 availabletaskstates availableTaskStates��  ��  ��   � o      ���� 60 numberavailabletaskstates numberAvailableTaskStates �  � � � l  + +��������  ��  ��   �  � � � l  + +�� � ���   � . ( identify if current state is in "array"    � � � � P   i d e n t i f y   i f   c u r r e n t   s t a t e   i s   i n   " a r r a y " �  � � � Y   + c ��� � ��� � k   5 ^ � �  � � � l  5 5��������  ��  ��   �  � � � l  5 5�� � ���   � r l check to see if current state is last one in "array" and select first state, or select next available state    � � � � �   c h e c k   t o   s e e   i f   c u r r e n t   s t a t e   i s   l a s t   o n e   i n   " a r r a y "   a n d   s e l e c t   f i r s t   s t a t e ,   o r   s e l e c t   n e x t   a v a i l a b l e   s t a t e �  ��� � Z   5 ^ � � ��� � =  5 = � � � o   5 6���� $0 currenttaskstate currentTaskState � c   6 < � � � n   6 : � � � 4   7 :�� �
�� 
cobj � o   8 9���� 60 numberavailabletaskstates numberAvailableTaskStates � o   6 7���� *0 availabletaskstates availableTaskStates � m   : ;��
�� 
ctxt � k   @ E � �  � � � r   @ C � � � m   @ A����  � o      ���� 0 nexttaskstate nextTaskState �  ��� �  S   D E��   �  � � � =  H P � � � o   H I���� $0 currenttaskstate currentTaskState � c   I O � � � n   I M � � � 4   J M�� �
�� 
cobj � o   K L���� 0 i   � o   I J���� *0 availabletaskstates availableTaskStates � m   M N��
�� 
ctxt �  ��� � k   S Z � �  � � � r   S X � � � [   S V � � � o   S T���� 0 i   � m   T U����  � o      ���� 0 nexttaskstate nextTaskState �  ��� �  S   Y Z��  ��  ��  ��  �� 0 i   � m   . /����  � o   / 0���� 60 numberavailabletaskstates numberAvailableTaskStates��   �  � � � l  d d��������  ��  ��   �  � � � l  d d�� � ���   � F @ current task state wasn't in array so just go to the first item    � � � � �   c u r r e n t   t a s k   s t a t e   w a s n ' t   i n   a r r a y   s o   j u s t   g o   t o   t h e   f i r s t   i t e m �  � � � Z   d s � ����� � =  d i � � � o   d e���� 0 nexttaskstate nextTaskState � m   e h � � � � �   � r   l o � � � m   l m����  � o      ���� 0 nexttaskstate nextTaskState��  ��   �  � � � l  t t��������  ��  ��   �  � � � l  t t�� � ���   �   select next task state    � � � � .   s e l e c t   n e x t   t a s k   s t a t e �  � � � r   t � � � � c   t z � � � n   t x � � � 4   u x�� �
�� 
cobj � o   v w���� 0 nexttaskstate nextTaskState � o   t u���� *0 availabletaskstates availableTaskStates � m   x y��
�� 
ctxt � n       � � � 1   } ��
�� 
FC?i � l  z } ����� � n   z } � � � 1   { }��
�� 
FCcn � o   z {���� 0 thedoc theDoc��  ��   �  � � � l  � ���������  ��  ��   �  ��� � l  � ���������  ��  ��  ��   4 m      � ��                                                                                  OFOC  alis    .  Macintosh HD                   BD ����OmniFocus.app                                                  ����            ����  
 cu             Applications  /:Applications:OmniFocus.app/     O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  ��  ��  ��       
�� � � � � ����������   � �~�}�|�{�z�y�x�w
�~ .aevtoappnull  �   � ****�} 0 thedoc theDoc�| *0 availabletaskstates availableTaskStates�{ $0 currenttaskstate currentTaskState�z 0 nexttaskstate nextTaskState�y 60 numberavailabletaskstates numberAvailableTaskStates�x  �w   � �v ��u�t � �s
�v .aevtoappnull  �   � **** � k     �  1�r�r  �u  �t   � �q�q 0 i     ��p�o�n g j�m�l�k�j�i ��h�g�f�e �
�p 
docu
�o 
FCdw�n 0 thedoc theDoc�m *0 availabletaskstates availableTaskStates
�l 
FCcn
�k 
FC?i
�j 
ctxt�i $0 currenttaskstate currentTaskState�h 0 nexttaskstate nextTaskState
�g .corecnte****       ****�f 60 numberavailabletaskstates numberAvailableTaskStates
�e 
cobj�s �� �*�k/�k/E�O��lvE�O��,�,�&E�O�E�O�j E�O 7k�kh  ����/�&  
kE�OY ���/�&  �kE�OY h[OY��O�a   kE�Y hO���/�&��,�,FOPU �  �d�c�b  ��a
�a 
FCDo
�d 
FCdw�c  �#
�b kfrmID   � �`�`    g j � �  i n c o m p l e t e�� �� ��  �  ascr  ��ޭ