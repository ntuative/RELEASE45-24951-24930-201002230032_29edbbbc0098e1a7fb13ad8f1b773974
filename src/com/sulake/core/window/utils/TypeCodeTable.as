package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_685;
         param1["bitmap"] = const_535;
         param1["border"] = const_498;
         param1["border_notify"] = const_1120;
         param1["button"] = const_363;
         param1["button_thick"] = const_653;
         param1["button_icon"] = const_1199;
         param1["button_group_left"] = const_579;
         param1["button_group_center"] = const_604;
         param1["button_group_right"] = const_592;
         param1["canvas"] = const_621;
         param1["checkbox"] = const_568;
         param1["closebutton"] = const_916;
         param1["container"] = const_282;
         param1["container_button"] = const_525;
         param1["display_object_wrapper"] = const_567;
         param1["dropmenu"] = const_463;
         param1["dropmenu_item"] = const_422;
         param1["frame"] = const_275;
         param1["frame_notify"] = const_1113;
         param1["header"] = const_546;
         param1["icon"] = const_820;
         param1["itemgrid"] = const_850;
         param1["itemgrid_horizontal"] = const_428;
         param1["itemgrid_vertical"] = const_494;
         param1["itemlist"] = const_943;
         param1["itemlist_horizontal"] = const_270;
         param1["itemlist_vertical"] = const_294;
         param1["maximizebox"] = const_1271;
         param1["menu"] = const_1211;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_818;
         param1["minimizebox"] = const_1171;
         param1["notify"] = const_1353;
         param1["IButtonWindow"] = const_657;
         param1["password"] = const_633;
         param1["radiobutton"] = const_630;
         param1["region"] = const_334;
         param1["restorebox"] = const_1143;
         param1["scaler"] = const_917;
         param1["scaler_horizontal"] = const_1197;
         param1["scaler_vertical"] = const_1121;
         param1["scrollbar_horizontal"] = const_367;
         param1["scrollbar_vertical"] = const_673;
         param1["scrollbar_slider_button_up"] = const_814;
         param1["scrollbar_slider_button_down"] = const_906;
         param1["scrollbar_slider_button_left"] = const_922;
         param1["scrollbar_slider_button_right"] = const_778;
         param1["scrollbar_slider_bar_horizontal"] = const_804;
         param1["scrollbar_slider_bar_vertical"] = const_946;
         param1["scrollbar_slider_track_horizontal"] = const_792;
         param1["scrollbar_slider_track_vertical"] = const_794;
         param1["scrollable_itemlist"] = const_1352;
         param1["scrollable_itemlist_vertical"] = const_420;
         param1["scrollable_itemlist_horizontal"] = const_972;
         param1["selector"] = const_550;
         param1["selector_list"] = const_534;
         param1["submenu"] = const_818;
         param1["tab_button"] = const_660;
         param1["tab_container_button"] = const_775;
         param1["tab_context"] = const_405;
         param1["tab_content"] = const_979;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_539;
         param1["input"] = const_582;
         param1["toolbar"] = const_1251;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
