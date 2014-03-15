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

import java.io.*;
import java.net.Socket;

import android.app.Activity;
import android.os.AsyncTask;
import android.util.Log;
import android.widget.Toast;

public class TelnetTask extends AsyncTask<Object, Object, Object> {

	private Activity activity = null;

	public TelnetTask(Activity activity) {
		this.activity = activity;
	}

	@Override
	protected Object doInBackground(Object... params) {
		Log.e("RootMyValet", "Starting binary puush");
		try {
			Thread.sleep(30000);
		} catch (InterruptedException e1) {
			e1.printStackTrace();
		}
		try {
			// Sleep for a minute, give the device time to root.
			Socket socket = new Socket("localhost", 23);

			DataOutputStream out = new DataOutputStream(
					socket.getOutputStream());
			final BufferedReader reader = new BufferedReader(
					new InputStreamReader(socket.getInputStream()));
			new Thread(new Runnable() {
				@Override
				public void run() {
					while (true) {
						try {
							Thread.sleep(100);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
						try {
							if (!reader.ready()) {
								continue;
							}
							String str = null;
							str = reader.readLine();
							if (str != null) {
								Log.e("RootMyValet", str);
							}
						} catch (IOException e) {
							break;
						}
					}
				}

			}).start();
			writeText("su" + "/n", out);
			writeText("mount -o rw,remount /system" + "/n", out);
			writeText("mount -o rw,remount /" + "/r/n", out);
			writeText("busybox cp /data/local/tmp/su /system/xbin/su" + "/n",
					out);
			writeText("chmod 06755 /system/xbin/su" + "/n", out);
			writeText("ln -s /system/xbin/su /system/bin/su" + "/n", out);
			// THIS IS JUST TESTING CODE TO SEE IF COMMANDS ARE BEING RUN!
			writeText("echo Hello World! > /data/local/tmp/test.txt /n", out);
			//END TESTING CODE
			writeText("pkill telnetd" + "/n", out);
			Thread.sleep(30);
			if (!socket.isClosed()) {
				socket.close();
			}
			Log.e("RootMyValet", "Pushed su binary");
			showHint("Pushed su binary!");
		} catch (Exception e) {
			Log.e("RootMyValet",
					"Exception occured - Root probably failed. :(", e);
		}
		return null;
	}

	private void writeText(String str, DataOutputStream out) throws IOException {
		out.writeUTF(str);
		out.flush();
	}

	private void showHint(final String text) {
		if (this.activity == null) {
			return;
		}
		this.activity.runOnUiThread(new Runnable() {

			@Override
			public void run() {
				Toast.makeText(activity, text, Toast.LENGTH_LONG).show();
			}
			
		});
	}
}
