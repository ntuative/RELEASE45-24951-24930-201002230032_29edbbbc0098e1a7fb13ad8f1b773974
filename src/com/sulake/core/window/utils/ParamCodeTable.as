package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["IButtonWindow"] = const_113;
         param1["bound_to_parent_rect"] = const_67;
         param1["child_window"] = const_826;
         param1["embedded_controller"] = const_295;
         param1["resize_to_accommodate_children"] = const_44;
         param1["input_event_processor"] = const_32;
         param1["internal_event_handling"] = const_548;
         param1["mouse_dragging_target"] = const_178;
         param1["mouse_dragging_trigger"] = const_279;
         param1["mouse_scaling_target"] = const_247;
         param1["mouse_scaling_trigger"] = const_366;
         param1["horizontal_mouse_scaling_trigger"] = const_193;
         param1["vertical_mouse_scaling_trigger"] = const_198;
         param1["observe_parent_input_events"] = const_828;
         param1["optimize_region_to_layout_size"] = const_401;
         param1["parent_window"] = const_903;
         param1["relative_horizontal_scale_center"] = const_146;
         param1["relative_horizontal_scale_fixed"] = const_105;
         param1["relative_horizontal_scale_move"] = const_291;
         param1["relative_horizontal_scale_strech"] = const_242;
         param1["relative_scale_center"] = const_954;
         param1["relative_scale_fixed"] = const_509;
         param1["relative_scale_move"] = const_966;
         param1["relative_scale_strech"] = const_936;
         param1["relative_vertical_scale_center"] = const_141;
         param1["relative_vertical_scale_fixed"] = const_98;
         param1["relative_vertical_scale_move"] = const_262;
         param1["relative_vertical_scale_strech"] = const_228;
         param1["on_resize_align_left"] = const_520;
         param1["on_resize_align_right"] = const_345;
         param1["on_resize_align_center"] = const_402;
         param1["on_resize_align_top"] = const_594;
         param1["on_resize_align_bottom"] = const_397;
         param1["on_resize_align_middle"] = const_432;
         param1["on_accommodate_align_left"] = const_831;
         param1["on_accommodate_align_right"] = const_336;
         param1["on_accommodate_align_center"] = const_510;
         param1["on_accommodate_align_top"] = const_815;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_629;
         param1["route_input_events_to_parent"] = const_456;
         param1["use_parent_graphic_context"] = const_15;
         param1["draggable_with_mouse"] = const_854;
         param1["scalable_with_mouse"] = const_860;
         param1["reflect_horizontal_resize_to_parent"] = const_383;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_213;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
