# Establishing your connection to the University of Washington VPM

Connect to University of Washington's OnDemand services for HYAK by pointing your browser to this link: 

**https://ondemand.hyak.uw.edu/**

You will be asked to sign in with your UWNetID and password. 

![](screenshots/uwnetid-sign-in.png 'sign-in')

After that, you will be prompted to authenticate with 2-Factor Authentication. Which will look something like the following:

![](screenshots/duo-push.png '2fa')

After that is complete, you will see the opening message as below: 

![](screenshots/ood-home.png 'ood')

We will review other features available to you in other workshops during this REU. To proceed with our task, we will click the menu option "Interactive Apps" and select Jupyter:

![](screenshots/interactive-apps.png 'apps')

A formula request will be the next screen. Please change the fllowing fields:

* Account change to "cei"
* Parition change to "compute"
* Jupyter Container change to "jupyter/datascience-notebook"
* Memory chenge to "30"
* Number of Hours change to "3"
* Finally make sure the "JupyterLab" option is selected

Push the "Launch" button to request the Jupyter Session.

![](screenshots/job-request.png 'job')

The request might wait in the queue for resources to be allocated, but shortly, there will be a button that says "Connect to Jupyter" click it to open JupyterLab. 

![](screenshots/connect-jupyter.png 'connect')

A new tab will open with your JupyterLab session, and look something like the below: 

![](screenshots/jupyterlab.png 'lab')

Here the left sidebar is a view of you Home directory on Hyak's third generation cluster called `klone`. As you create Jupyter Notebooks, they will be appear here or inside of a subdirectory. We'll talk more about this soon. 

The panel on the right shows choices of the type of Notebook you can open. For this tutorial, we will be using the Python 3 (ipykernel). Go ahead an click on the Python 3 kernel under the Notebook section as shown in Red. 

This will prompt JupyterLab to confirm your kernel choice. Make sure "Python 3 (ipykernel)" is showing and click the "Select".

![](screenshots/kernel-confirm.png 'select')

You have just started your first Jupyter Notebook of this workshop titled "Untitled.ipynb". The file extension ".ipynb" is the standard extension for ipykernel notebooks, but we can give our Notebook a name. Right click on the "Untitled.ipynb" tab and select "Rename Notebook..." and choose a new name for it. 

![](screenshots/rename-nb.png 'rename')

Now you are ready to learn some Python. 

Your session will automatically end after 3 hours (or your selected time limit), but you can end your session early by closing the window showing JupyterLab, and finding the OnDemand service window showing your running Jupyter Session. Use the Delete button to end your session manually. 

![](screenshots/connect-jupyter.png 'connect')