   M S B A M L   `   `   `  ����J  FProjectBeforeBD, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:ProjectBeforeBDProjectBeforeBD  5          ProjectBeforeBD.FlightBar   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:ProjectBeforeBD     5      .��5	      � -   5          �Name$  MainGrid��5	      .+�5
   
   � -   5        $  WideGrid��5
      $��30��6!   $	��Top=�6-    � ColumnDefinitions 5      �� 5      $
��0.5* �6#   �� 5      $
��0.5* �6#   �� 5      �� 5      �� 5      $
��1.5* �6#   �� 5      �� 5       � RowDefinitions 5      �� 5      .+�5      �� -   5         ��Name$ 
Background��5      $
��Left=�6,   $��30��6G   $	��620��6S   $��0��6_   $��7��6o   
���   �$	��Top=�6�   ���	#6389F6FF �� RadiusX$ 10��6�    �� RadiusY$ 10��6�   �� 5      -   5         ��Name$ 	FromBlock��5       �� TextAlignment$ Center=�6+   $��Center=�6B   $��0��6]   $��Откуда��6m   $��44��6{   �� 5      
���   �$��1q�6)   $��1��6=   ._�5      �� -   5        $ ToBlock��5      $ Center=�6-   $��Center=�6D   $��1��6_   $��Куда��6o   $��44��6{   5      �� 5       
���   �$��1q�6)   $��2��6=   ._�5!      �� -   5        $ 	DateBlock��5!      $ Center=�6/   $��Center=�6F   $��2��6a   $��Дата��6q   $��88��6}   5"      �� 5#      
���   �$��1q�6)   $��3��6=   ._�5$      �� -   5        $ 	TimeBlock��5$      $ Center=�6/   $��Center=�6F   $��3��6a   $��
Время��6q   $��88��6~   5%      �� 5&      
���   �$��1q�6)   $��4��6=   ._�5'      �� -   5        $ DurationBlock��5'      $ Center=�63   $��Center=�6J   $��4��6e   $��Длительность��6u   $��88��6�   5(      �� 5)      
���   �$��1q�6)   $��5��6=   ._�5*      �� -	   5        $ 	CostBlock��5*      $ Center=�6/   $��Center=�6F   $��5��6a   $��Стоимость��6q   $��88��6�   5+      �� 5,      -
   5         ��Name$ 	SelectBut��5,      $��6��6(   $��Выбрать��68   $��88��6J   6X   5-      5.      5/      