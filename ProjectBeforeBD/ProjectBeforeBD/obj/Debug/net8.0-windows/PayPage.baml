   M S B A M L   `   `   `  ����J  FProjectBeforeBD, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:ProjectBeforeBDProjectBeforeBD  5          ProjectBeforeBD.PayPage   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:ProjectBeforeBD     5      .��5	      � -   5          �Name$  
MainCanvas��5	      $	��450��6   $	��800��6,   ��5   
   �� 5       �� ImageSource$ /MainBack.jpg��6   .+�5   
   �� $��Center=�6   $	��281��61   
���   �$	��Top=�6M   $	��284��6e   ���	#99C8C8C8 �� RadiusX$ 10��6�    �� RadiusY$ 10��6�   $��	0,107,0,0q�6�   �� 5   
   -   5         ��Name$ Naming��5      $��AIRWAYS��6    $
��Left=�62   $��	80,10,0,0q�6M   $	��Top=�6`   $��50��6x   $	��300��6�   $��36(�6�   ���	#FF1217206�   �� 5   
   -   5        $ Speach��5      $0��*В одной оплате от мечты��6    $
��Left=�6B   $��	80,60,0,0q�6]   $	��Top=�6p   $��42��6�   $	��355��6�   $��24(�6�   
�������6�   �� 5   
   -   5        $ CardNumberLabl��5      $��Номер карты:��6(   $
��Left=�6?   $��276,165,0,0q�6Z   $	��Top=�6o   �� 5   
   -   5        $ DateCardLabl��5      $��Месяц/Год:��6&   $
��Left=�6;   $��276,192,0,0q�6V   $	��Top=�6k   �� 5   
   -   5         ��Name$ CardNumberText��5      $
��Left=�6*   $��362,169,0,0q�6E    �� TextWrapping$
 Wrap=�6Z   $	��Top=�6n   $	��168��6�    �� 	MaxLength$ 16��6�   �� 5   
   -   5        $ DateCardText��5      $
��Left=�6(   $��348,196,0,0q�6C   $
 Wrap=�6X   $	��Top=�6l   $��66��6�   $ 5��6�   �� 5   
   -   5        $ SumLabl��5      $��К оплате:��6!   $
��Left=�65   $��276,134,0,0q�6P   $	��Top=�6e   �� 5   
   -	   5        $ SumText��5      $��-��6!   $
��Left=�6-   $��334,134,0,0q�6H   $	��Top=�6]   $��94��6u   �� 5   
   -
   5        $ CVVLabl��5      $��CVV/CVC:��6!   $
��Left=�64   $��417,192,0,0q�6O   $	��Top=�6d   �� 5   
   -   5        $ CVVText��5      $
��Left=�6#   $��479,196,0,0q�6>   $
 Wrap=�6S   $	��Top=�6g   $��51��6   $ 3��6�   6�   �� 5   
   -   5         ��Name$ PAYMENTBUTTON��5      $��Оплатить��6(   $��Center=�6;   $��	0,238,0,0q�6X   $	��Top=�6k   $��25��6�   $��64��6�   6�   �� 5   
   -   5        	 ��Name$	 	ErrorText��5      $��Center=�6'   $��	0,268,0,0q�6D   $
��Wrap=�6W   $	��Top=�6k   $��35��6�   $	��212��6�   
 �� TextAlignment$
 Center=�6�   
���  ��6�   5      5      