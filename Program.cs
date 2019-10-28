using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Windows.Forms;

namespace SharpShot
{
    class Program
    {
        static void FullScreenShot(String fullpath, ImageFormat format)
        {
            Rectangle bounds = Screen.GetBounds(Point.Empty);
            using (Bitmap bitmap = new Bitmap(bounds.Width, bounds.Height))
            {
                using (Graphics g = Graphics.FromImage(bitmap))
                {
                    g.CopyFromScreen(Point.Empty, Point.Empty, bounds.Size);
                }
                bitmap.Save(fullpath, format);
            }
        }

        static void Main(string[] args)
        {
            FullScreenShot(args[0], ImageFormat.Png);
        }
    }
}
