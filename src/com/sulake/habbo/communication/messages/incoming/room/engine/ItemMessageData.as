package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_75:Number = 0;
      
      private var _data:String = "";
      
      private var var_1377:int = 0;
      
      private var var_31:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1984:Boolean = false;
      
      private var var_2353:String = "";
      
      private var _id:int = 0;
      
      private var var_175:Boolean = false;
      
      private var var_203:String = "";
      
      private var var_1983:int = 0;
      
      private var var_1981:int = 0;
      
      private var var_1982:int = 0;
      
      private var var_1985:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1984 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_175)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1984;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_175)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_203;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_175)
         {
            var_1982 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_175)
         {
            var_1983 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_175)
         {
            var_1981 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_175)
         {
            var_203 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_175)
         {
            var_1985 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_175)
         {
            var_31 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1982;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_175)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1983;
      }
      
      public function get wallY() : Number
      {
         return var_1981;
      }
      
      public function get localY() : Number
      {
         return var_1985;
      }
      
      public function setReadOnly() : void
      {
         var_175 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_75;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_175)
         {
            var_75 = param1;
         }
      }
   }
}
