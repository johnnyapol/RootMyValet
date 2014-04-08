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

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.Toast;

/**
 * RootMyValet is a root apk for the ZTE Valet. It can work on another devices as well. Uses a modifed version of the Xperia Exploit by CUBE
 * @author Unkn0wn0ne
 */
public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	public void run(View view) {
          	Toast.makeText(this, "Starting binary push....", Toast.LENGTH_LONG).show();
		try {
			Runtime.getRuntime().exec("/data/local/tmp/roothandler"); //RootHandler is modifed from getroot exploit so it will start the push.sh script as root
		} catch (IOException e) {
			Toast.makeText(this, "An IOException has occured, did you push the roothandler binary to /data/local/tmp and set it execute permissions? Message: " + e.getMessage());
			e.printStackTrace();
		}
	}
}
