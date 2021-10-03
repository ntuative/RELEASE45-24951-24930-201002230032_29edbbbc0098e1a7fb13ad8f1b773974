package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_628:String = "Rectangle";
      
      public static const const_39:String = "Boolean";
      
      public static const const_480:String = "Number";
      
      public static const const_41:String = "int";
      
      public static const STRING:String = "String";
      
      public static const const_584:String = "Point";
      
      public static const const_851:String = "Array";
      
      public static const const_856:String = "uint";
      
      public static const const_454:String = "hex";
      
      public static const const_971:String = "Map";
       
      
      private var var_523:String;
      
      private var var_155:Object;
      
      private var var_2264:Boolean;
      
      private var _type:String;
      
      private var var_1744:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_523 = param1;
         var_155 = param2;
         _type = param3;
         var_1744 = param4;
         var_2264 = param3 == const_971 || param3 == const_851 || param3 == const_584 || param3 == const_628;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_454:
               return "0x" + uint(var_155).toString(16);
            case const_39:
               return Boolean(var_155) == true ? "true" : "false";
            case const_584:
               return "Point(" + Point(var_155).x + ", " + Point(var_155).y + ")";
            case const_628:
               return "Rectangle(" + Rectangle(var_155).x + ", " + Rectangle(var_155).y + ", " + Rectangle(var_155).width + ", " + Rectangle(var_155).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_971:
               _loc3_ = var_155 as Map;
               _loc1_ = "<var key=\"" + var_523 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_851:
               _loc4_ = var_155 as Array;
               _loc1_ = "<var key=\"" + var_523 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_584:
               _loc5_ = var_155 as Point;
               _loc1_ = "<var key=\"" + var_523 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_628:
               _loc6_ = var_155 as Rectangle;
               _loc1_ = "<var key=\"" + var_523 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_454:
               _loc1_ = "<var key=\"" + var_523 + "\" value=\"" + "0x" + uint(var_155).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_523 + "\" value=\"" + var_155 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_155;
      }
      
      public function get valid() : Boolean
      {
         return var_1744;
      }
      
      public function get key() : String
      {
         return var_523;
      }
   }
}
