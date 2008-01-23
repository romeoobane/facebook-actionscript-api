/*
Copyright (c) 2007 Jason Crist

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/

/**
 *  Delegates the call to facebook.auth.getSession
 * 
 * @author Jason Crist 
 * @author Chris Hill
 */
package com.pbking.facebook.delegates.auth
{
	import com.pbking.facebook.FacebookCall;
	import com.pbking.facebook.Facebook;
	import flash.events.Event;
	import com.pbking.facebook.delegates.FacebookDelegate;
	
	public class GetSession_delegate extends FacebookDelegate
	{
		// VARIABLES //////////
		
		private var auth_token:String;
		
		//results
		
		public var session_key:String;
		public var uid:int;
		public var secret:String;
		public var expires:Number;
		
		// CONSTRUCTION //////////
		
		function GetSession_delegate(auth_token:String)
		{
			this.auth_token = auth_token;

			Facebook.instance.logHack("starting facebook session with auth_token: " + auth_token);

			fbCall.setRequestArgument("auth_token", auth_token);
			fbCall.post("facebook.auth.getSession", fBook.default_rest_url, true);
		}
		
		// FUNCTIONS //////////
		
		override protected function handleResult(resultXML:XML):void
		{
			default xml namespace = fBook.FACEBOOK_NAMESPACE;
			
			session_key = resultXML..session_key;
			uid = resultXML..uid;
			secret = resultXML..secret;
			expires = resultXML..expires;
		} 
		

	}
}