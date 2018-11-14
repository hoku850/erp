﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MainProgram.bus;

namespace MainProgram
{
    public partial class FormProduction : Form
    {
        public FormProduction()
        {
            InitializeComponent();
        }

        private void FormProduction_Load(object sender, EventArgs e)
        {

        }

        private void panelPurchaseOrder_MouseEnter(object sender, EventArgs e)
        {
            PanelExtend.setLableControlStyle(this.labelPurchaseOrder);
        }

        private void panelPurchaseIn_MouseEnter(object sender, EventArgs e)
        {
            PanelExtend.setLableControlStyle(this.labelPurchaseIn);
        }

        private void panelPurchaseOrder_Click(object sender, EventArgs e)
        {
            FormPurchaseOrder fpo = new FormPurchaseOrder();
            fpo.ShowDialog();
        }

        private void panelPurchaseIn_Click(object sender, EventArgs e)
        {
            FormPurchaseInOrder fpio = new FormPurchaseInOrder();
            fpio.ShowDialog();
        }

        private void panelPurchaseInvoice_Click(object sender, EventArgs e)
        {

        }

        private void panelProjectMaterieCount_MouseEnter(object sender, EventArgs e)
        {
            PanelExtend.setLableControlStyle(this.labelProjectMaterieCount);
        }

        private void panelProjectInfo_MouseEnter(object sender, EventArgs e)
        {
            PanelExtend.setLableControlStyle(this.labelProjectInfo);
        }

        private void panelStorageProductionOut_MouseEnter(object sender, EventArgs e)
        {
            PanelExtend.setLableControlStyle(this.labelStorageProductionOut);
        }

        private void panelStorageSaleOut_MouseDown(object sender, EventArgs e)
        {
            PanelExtend.setLableControlStyle(this.labelStorageSaleOut);
        }

        private void panelStorageProductionOut_Click(object sender, EventArgs e)
        {
            FormMaterielOutOrder fmoo = new FormMaterielOutOrder();
            fmoo.ShowDialog();
        }

        private void panelStorageSaleOut_Click(object sender, EventArgs e)
        {
            FormSaleOutOrder fsoo = new FormSaleOutOrder();
            fsoo.ShowDialog();
        }

        private void panelProjectMaterieCount_Click(object sender, EventArgs e)
        {

        }

        private void panelProjectInfo_Click(object sender, EventArgs e)
        {

        }

        private void panelProBom_MouseEnter(object sender, EventArgs e)
        {
            PanelExtend.setLableControlStyle(this.labelProBom);
        }

        private void panelProBom_Click(object sender, EventArgs e)
        {

        }
    }
}
