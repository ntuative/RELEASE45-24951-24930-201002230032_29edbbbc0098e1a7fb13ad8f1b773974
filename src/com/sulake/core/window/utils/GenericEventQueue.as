package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class GenericEventQueue implements IDisposable
   {
       
      
      protected var _eventDispatcher:IEventDispatcher;
      
      protected var _disposed:Boolean = false;
      
      protected var _index:uint = 0;
      
      protected var var_267:Array;
      
      public function GenericEventQueue(param1:IEventDispatcher)
      {
         super();
         var_267 = new Array();
         _eventDispatcher = param1;
      }
      
      public function get length() : uint
      {
         return var_267.length;
      }
      
      public function begin() : void
      {
         _index = 0;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      protected function eventListener(param1:Event) : void
      {
         var_267.push(param1);
      }
      
      public function remove() : void
      {
         var_267.splice(_index - 1,1);
         if(_index > 0)
         {
            --_index;
         }
      }
      
      public function next() : Event
      {
         var _loc1_:* = null;
         if(_index < var_267.length)
         {
            _loc1_ = var_267[_index];
            ++_index;
         }
         return _loc1_;
      }
      
      public function end() : void
      {
         _index = 0;
      }
      
      public function flush() : void
      {
         var_267.splice(0,var_267.length);
         _index = 0;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _eventDispatcher = null;
            var_267 = null;
            _disposed = true;
         }
      }
   }
}
