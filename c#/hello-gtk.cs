using Gtk;
using System;

class Hello
{
    static void Main ()
    {
        Application.Init ();

        Window window = new Window ("hello mono world");
        window.Show ();

        Application.Run ();
    }
}
