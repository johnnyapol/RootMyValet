/*
 * Copyright (C) 2014 Unkn0wn0ne
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.Unkn0wn0ne.rootmyvalet;

import java.io.IOException;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class BootHandler extends BroadcastReceiver{
	
	@Override
	public void onReceive(Context arg0, Intent arg1) {
		try {
			Runtime.getRuntime().exec("/data/local/tmp/roothandler"); //RootHandler is modifed from getroot exploit so It will start the push.sh script as root
		} catch (IOException e) {
			Toast.makeText(this, "An IOException has occured, did you push the roothandler binary to /data/local/tmp and set it execute permissions? Message: " + e.getMessage(), Toast.LENGTH_LONG).show();
			e.printStackTrace();
		} 
	}

}
