   M S B A M L   `   `   `  ����J  FProjectBeforeBD, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:ProjectBeforeBDProjectBeforeBD  5           ProjectBeforeBD.RaceChoose   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:ProjectBeforeBD     5      .��5	      � -   5          �Name$  
MainCanvas��5	      $	��450��6   $	��800��6,   ��5   
   �� 5       �� ImageSource$ /MainBack.jpg��6   .+�5   
   �� $��Center=�6   $	��281��61   
���   �$	��Top=�6M   $	��638��6e   ���	#99C8C8C8 �� RadiusX$ 10��6�    �� RadiusY$ 10��6�   $��	0,107,0,0q�6�   �� 5   
   -   5         ��Name$ FlightsScroller��5      $��Disabled=�60   $
��Auto=�6Y   $��90,120,90,180q�6|   .��5      � -   5         �Name$ 
RacesPanel��5      $	��250��6,   ��6<   �� *ViewportWidth+ �� ElementName$ FlightsScroller��5      5      �� 5   
   -   5         ��Name$ Naming��5      $��AIRWAYS��6    $
��Left=�62   $��	80,10,0,0q�6M   $	��Top=�6`   $��50��6x   $	��300��6�   $��36(�6�   ���	#FF1217206�   �� 5   
   -   5        $ Speach��5      $0��*В одном выборе от мечты��6    $
��Left=�6B   $��	80,60,0,0q�6]   $	��Top=�6p   $��42��6�   $	��355��6�   $��24(�6�   
�������6�   �� 5   
   -   5         ��Name$ VegeterianMenu��5      $+��%Вегетариансоке меню��6+   $
��Left=�6I   $��258,275,0,0q�6d   $	��Top=�6y   6�   	� 5   
   -   5        	 	�Name$	 LuggageNorm��5      $��Обычный багаж��6+   $
��Left=�6C   $��120,295,0,0q�6^   $	��Top=�6s   
 	� 	GroupName$
 Luggage��6�   6�   	� 5   
   -   5        $	 LuggageFull��5      $'��!Увеличенный багаж��6+   $
��Left=�6G   $��120,315,0,0q�6b   $	��Top=�6w   $
 Luggage��6�   6�   	� 5   
   -	   5        $	 LuggageNone��5      $��Без багажа��6+   $
��Left=�6@   $��120,275,0,0q�6[   $	��Top=�6p    d� 	IsChecked$
 TrueY�6�   $
 Luggage��6�   6�   �� 5   
   -
   5         ��Name$ 	CostLabel��5      $
��Left=�6'   $��480,274,0,0q�6B   $
��Wrap=�6W   $*��$Итоговая стоимость:��6k   $	��Top=�6�   �� 5   
   -   5        $ PassangersCountText��5      $
��Left=�61   $��262,294,0,0q�6L   $
��Wrap=�6a   $.��(Пассажиров с местом: -1��6u   $	��Top=�6�   �� 5   
   -   5        $ CostText��5      $
��Left=�6&   $��598,275,0,0q�6A   $
��Wrap=�6V   $��-��6j   $	��Top=�6s   $��95��6�   �� 5   
   -   5         ��Name$ ToPayBut��5      $$��Перейти к оплате��6#   $
��Left=�6>   $��480,295,0,0q�6Y   $	��Top=�6n   $	��113��6�   6�   �� 5   
   -   5        $ 	ErrorText��5      $
��Left=�6'   $��480,315,0,0q�6B   $
��Wrap=�6W   $	��Top=�6k   $��35��6�   $	��213��6�    �� TextAlignment$ Center=�6�   
���  ��6�   �� 5    
   -   5        $ SelectedRoyalty��5       $
��Left=�6-   $��262,315,0,0q�6H   $
��Wrap=�6]   $3��-Выбранный класс: никакой��6q   $	��Top=�6�   5"      5#      