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

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;

@SuppressWarnings("rawtypes")
public class TelnetTask extends AsyncTask {

	@SuppressWarnings("unused")
	private Context activity;

	public TelnetTask(Context activity) {
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
			final DataInputStream dis = new DataInputStream(
					socket.getInputStream());
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
							if (dis.available() > 0) {
								byte[] buffer = new byte[1024];
								dis.readFully(buffer);
								Log.e("RootMyValet", new String(buffer));

							}
						} catch (IOException e) {
							break;
						}
					}
				}

			}).start();
			out.writeBytes("su" + "/r/n");
			out.flush();
			out.writeBytes("mount -o rw,remount /system" + "/r/n");
			out.flush();
			out.writeBytes("mount -o rw,remount /" + "/r/n");
			out.flush();
			out.writeBytes("busybox cp /data/local/tmp/su /system/xbin/su"
					+ "/r/n");
			out.flush();
			out.writeBytes("chmod 06755 /system/xbin/su" + "/r/n");
			out.flush();
			out.writeBytes("ln -s /system/xbin/su /system/bin/su" + "/r/n");
			out.flush();
			Thread.sleep(30l);
			socket.close();
			Log.e("RootMyValet", "Pushed su binary");
		} catch (Exception e) {
			Log.e("RootMyValet", "Exception occured - Root probably failed. :(", e);
		}

		return null;
	}
}
