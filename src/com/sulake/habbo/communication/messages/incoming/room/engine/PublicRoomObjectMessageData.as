package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var var_1012:int = 0;
      
      private var var_75:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_175:Boolean = false;
      
      private var var_203:int = 0;
      
      private var _type:String = "";
      
      private var _name:String = "";
      
      private var var_74:Number = 0;
      
      private var var_1013:int = 0;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_175)
         {
            var_75 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return var_1012;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get dir() : int
      {
         return var_203;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         if(!var_175)
         {
            _name = param1;
         }
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_175)
         {
            var_203 = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_175)
         {
            _y = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_175 = true;
      }
      
      public function get z() : Number
      {
         return var_75;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_175)
         {
            var_1012 = param1;
         }
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_175)
         {
            var_1013 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_175)
         {
            var_74 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_74;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set type(param1:String) : void
      {
         if(!var_175)
         {
            _type = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1013;
      }
   }
}
