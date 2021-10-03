package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_1013:int = 0;
      
      private var _data:String = "";
      
      private var var_1377:int = -1;
      
      private var var_31:int = 0;
      
      private var _type:int = 0;
      
      private var var_1012:int = 0;
      
      private var var_2353:String = "";
      
      private var var_1649:int = 0;
      
      private var _id:int = 0;
      
      private var var_175:Boolean = false;
      
      private var var_203:int = 0;
      
      private var var_2042:String = null;
      
      private var var_74:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_75:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_175)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_175)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_203;
      }
      
      public function get extra() : int
      {
         return var_1377;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_175)
         {
            var_203 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_175)
         {
            var_74 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_175)
         {
            var_1377 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_75;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_175)
         {
            var_31 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1649;
      }
      
      public function get staticClass() : String
      {
         return var_2042;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_175)
         {
            var_1649 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_175)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_175)
         {
            var_2042 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_175 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_175)
         {
            var_1013 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_175)
         {
            var_1012 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_175)
         {
            var_75 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1013;
      }
      
      public function get x() : Number
      {
         return var_74;
      }
      
      public function get sizeY() : int
      {
         return var_1012;
      }
   }
}
