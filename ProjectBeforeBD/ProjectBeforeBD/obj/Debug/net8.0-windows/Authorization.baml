   M S B A M L   `   `   `  ����J  FProjectBeforeBD, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:ProjectBeforeBDProjectBeforeBD  5      #    ProjectBeforeBD.Authorization   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:ProjectBeforeBD     5      .��5	      � -   5          �Name$  
MainCanvas��5	      $	��450��6   $	��800��6,   ��5   
   �� 5       �� ImageSource$ /MainBack.jpg��6   .+�5   
   �� $��Center=�6   $	��281��61   
���   �$	��Top=�6M   $	��284��6e   ���	#99C8C8C8 �� RadiusX$ 10��6�    �� RadiusY$ 10��6�   $��	0,107,0,0q�6�   �� 5   
   -   5         ��Name$ Naming��5      $��AIRWAYS��6    $
��Left=�62   $��	80,10,0,0q�6M   $	��Top=�6`   $��50��6x   $	��300��6�   $��36(�6�   ���	#FF1217206�   �� 5   
   -   5        $ Speach��5      $:��4В одной авторизации от метчы��6    $
��Left=�6G   $��	80,60,0,0q�6b   $	��Top=�6u   $��42��6�   $	��355��6�   $��24(�6�   
�������6�   �� 5   
   -   5        $ 	LabelMail��5      $��Почта:��6#   $
��Left=�64   $��270,124,0,0q�6O   $	��Top=�6d   �� 5   
   -   5        $ LabelPassword��5      $��Пароль:��6'   $
��Left=�69   $��270,151,0,0q�6T   $	��Top=�6i   �� 5   
   -   5         ��Name$ 	EmailText��5      $
��Left=�6%   $��321,128,0,0q�6@    �� TextWrapping$
 Wrap=�6U   $	��Top=�6i   $	��203��6�   �� 5   
   -   5        $ PasswordText��5      $
��Left=�6(   $��329,155,0,0q�6C   $
 Wrap=�6X   $	��Top=�6l   $	��195��6�   �� 5   
   -   5         ��Name$ 	LogInBut1��5      $"��Авторизоваться��6$   $
��Left=�6=   $��355,294,0,0q�6X   $	��Top=�6m   ���	#7FDDDDDD6�   �� 5   
   -	   5        $ NotHaveAccLabel��5      $%��Ешё нет аккаунта?��6)   $
��Left=�6E   $��324,314,0,0q�6`   $	��Top=�6u   $��26��6�   �� 5   
   -
   5        $ RegBut��5      $��Создайте��6!   $
��Left=�64   $��432,314,0,0q�6O   $	��Top=�6d   $��26��6|   ���	#7FDDDDDD � UseLayoutRounding$ False��6�   6�   �� 5   
   -   5        	 ��Name$	 	ErrorText��5      $��Center=�6'   $��	0,345,0,0q�6D   $
��Wrap=�6W   $	��Top=�6k   $��35��6�   $	��260��6�   
 �� TextAlignment$
 Center=�6�   
���  ��6�   5      5      