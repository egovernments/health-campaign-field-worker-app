interface LocalizationInput {
    code: string;
    module: string;
    en_DEMO: string;
    pt_DEMO: string;
}

interface LocalizationOutput {
    code: string;
    message: string;
    module: string;
    locale: string;
}

const input = [
  {
    "module": "hcm-common",
    "code": "CORE_COMMON_CONTINUE",
    "en_DEMO": "Continue",
    "pt_DEMO": "Prosseguir"
  },
  {
    "module": "hcm-common",
    "code": "CORE_COMMON_AGE",
    "en_DEMO": "Age",
    "pt_DEMO": "Era"
  },
  {
    "module": "hcm-common",
    "code": "CORE_COMMON_GENDER",
    "en_DEMO": "Gender",
    "pt_DEMO": "G�nero"
  },
  {
    "module": "hcm-common",
    "code": "CORE_COMMON_MOBILE_NUMBER",
    "en_DEMO": "Mobile Number",
    "pt_DEMO": "N�mero de celular"
  },
  {
    "module": "hcm-common",
    "code": "CORE_COMMON_SUBMIT",
    "en_DEMO": "Submit",
    "pt_DEMO": "Enviar"
  },
  {
    "module": "hcm-common",
    "code": "CORE_COMMON_CANCEL",
    "en_DEMO": "Cancel",
    "pt_DEMO": "Cancelar"
  },
  {
    "module": "hcm-login",
    "code": "LOGIN_LABEL_TEXT",
    "en_DEMO": "Login",
    "pt_DEMO": "Conecte-se"
  },
  {
    "module": "hcm-login",
    "code": "USER_ID_PLACEHOLDER",
    "en_DEMO": "User ID",
    "pt_DEMO": "ID do usu�rio"
  },
  {
    "module": "hcm-login",
    "code": "PASSWORD_PLACEHOLDER",
    "en_DEMO": "Password",
    "pt_DEMO": "Senha"
  },
  {
    "module": "hcm-login",
    "code": "LOGIN_ACTION_LABEL",
    "en_DEMO": "Login",
    "pt_DEMO": "Conecte-se"
  },
  {
    "module": "hcm-forgot-password",
    "code": "FORGOT_PASSWORD_LABEL_TEXT",
    "en_DEMO": "Forgot Password",
    "pt_DEMO": "Esqueceu a senha"
  },
  {
    "module": "hcm-forgot-password",
    "code": "FORGOT_PASSWORD_CONTENT_TEXT",
    "en_DEMO": "Please contact your administrator if you have forgotten your password",
    "pt_DEMO": "Entre em contato com seu administrador se voc� esqueceu sua senha"
  },
  {
    "module": "hcm-forgot-password",
    "code": "PRIMARY_ACTION_LABEL",
    "en_DEMO": "OK",
    "pt_DEMO": "OK"
  },
  {
    "module": "hcm-forgot-password",
    "code": "FORGOT_PASSWORD_ACTION_LABEL",
    "en_DEMO": "Forgot Password?",
    "pt_DEMO": "Esqueceu a senha?"
  },
  {
    "module": "hcm-home",
    "code": "HOME_BENEFICIARY_LABEL",
    "en_DEMO": "Beneficiaries",
    "pt_DEMO": "Benefici�rios"
  },
  {
    "module": "hcm-home",
    "code": "HOME_VIEW_REPORTS_LABEL",
    "en_DEMO": "View Reports",
    "pt_DEMO": "Ver relat�rios"
  },
  {
    "module": "hcm-home",
    "code": "HOME_SYNC_DATA_LABEL",
    "en_DEMO": "Sync Data",
    "pt_DEMO": "Dados de sincroniza��o"
  },
  {
    "module": "hcm-home",
    "code": "HOME_CALL_BACK_LABEL",
    "en_DEMO": "Call Supervisor",
    "pt_DEMO": "Ligue para o supervisor"
  },
  {
    "module": "hcm-home",
    "code": "HOME_FILE_COMPLAINT",
    "en_DEMO": "File Complaint",
    "pt_DEMO": "Reclama��o do arquivo"
  },
  {
    "module": "hcm-home",
    "code": "PROGRESS_INDICATOR_TITLE",
    "en_DEMO": "more to reach target",
    "pt_DEMO": "mais para atingir o alvo"
  },
  {
    "module": "hcm-home",
    "code": "PROGRESS_INDICATOR_PREFIX_LABEL",
    "en_DEMO": "completed",
    "pt_DEMO": "conclu�do"
  },
  {
    "module": "hcm-beneficiary",
    "code": "BENEFICIARY_STATISTICS_LABEL_TEXT",
    "en_DEMO": "Search Households",
    "pt_DEMO": "Pesquise fam�lias"
  },
  {
    "module": "hcm-beneficiary",
    "code": "NO_OF_HOUSEHOLDS_REGISTERED",
    "en_DEMO": "No. of Households\nRegistered",
    "pt_DEMO": "No. de fam�lias\nRegistrado"
  },
  {
    "module": "hcm-beneficiary",
    "code": "NO_OF_RESOURCES_DELIVERED",
    "en_DEMO": "No. of Bednets\nDelivered",
    "pt_DEMO": "No. de redes de cama\nEntregue"
  },
  {
    "module": "hcm-beneficiary",
    "code": "BENEFICIARY_SEARCH_HINT_TEXT",
    "en_DEMO": "Enter the name of household head",
    "pt_DEMO": "Digite o nome do chefe da fam�lia"
  },
  {
    "module": "hcm-beneficiary",
    "code": "BENEFICIARY_INFO_DESCRIPTION",
    "en_DEMO": "Click on Register New Household button to add details.",
    "pt_DEMO": "Clique em Registrar um novo bot�o dom�stico para adicionar detalhes."
  },
  {
    "module": "hcm-beneficiary",
    "code": "BENEFICIARY_INFO_TITLE",
    "en_DEMO": "Match not found!",
    "pt_DEMO": "Match n�o encontrado!"
  },
  {
    "module": "hcm-beneficiary",
    "code": "BENEFICIARY_ADD_ACTION_LABEL",
    "en_DEMO": "Register New Household",
    "pt_DEMO": "Registrar uma nova fam�lia"
  },
  {
    "module": "hcm-beneficiary",
    "code": "ICON_LABEL",
    "en_DEMO": "Open",
    "pt_DEMO": "Abrir"
  },
  {
    "module": "hcm-beneficiary",
    "code": "INDIVIDUAL_LABEL_TEXT",
    "en_DEMO": "Individual Details",
    "pt_DEMO": "Detalhes individuais"
  },
  {
    "module": "hcm-beneficiary",
    "code": "INDIVIDUAL_NAME_LABEL_TEXT",
    "en_DEMO": "Name of the Individual*",
    "pt_DEMO": "Nome do indiv�duo*"
  },
  {
    "module": "hcm-beneficiary",
    "code": "HEAD_OF_HOUSEHOLD_LABEL_TEXT",
    "en_DEMO": "Head of household",
    "pt_DEMO": "Chefe de fam�lia"
  },
  {
    "module": "hcm-beneficiary",
    "code": "ID_TYPE_LABEL_TEXT",
    "en_DEMO": "ID Type",
    "pt_DEMO": "Tipo de identifica��o"
  },
  {
    "module": "hcm-beneficiary",
    "code": "ID_NUMBER_LABEL_TEXT",
    "en_DEMO": "ID Number*",
    "pt_DEMO": "N�mero de identidade*"
  },
  {
    "module": "hcm-beneficiary",
    "code": "ID_NUMBER_SUGGESTION_TEXT",
    "en_DEMO": "Enter 10 digit ID number",
    "pt_DEMO": "Insira o n�mero de identifica��o de 10 d�gitos"
  },
  {
    "module": "hcm-beneficiary",
    "code": "DOB_LABEL_TEXT",
    "en_DEMO": "Date of Birth",
    "pt_DEMO": "Data de nascimento"
  },
  {
    "module": "hcm-common",
    "code": "AGE_LABEL_TEXT",
    "en_DEMO": "Age",
    "pt_DEMO": "Era"
  },
  {
    "module": "hcm-common",
    "code": "SEPARATOR_LABEL_TEXT",
    "en_DEMO": "(or)",
    "pt_DEMO": "(ou)"
  },
  {
    "module": "hcm-common",
    "code": "GENDER_LABEL_TEXT",
    "en_DEMO": "Gender",
    "pt_DEMO": "G�nero"
  },
  {
    "module": "hcm-common",
    "code": "MOBILE_NUMBER_LABEL_TEXT",
    "en_DEMO": "Mobile Number",
    "pt_DEMO": "N�mero de celular"
  },
  {
    "module": "hcm-common",
    "code": "SUBMIT_LABEL_TEXT",
    "en_DEMO": "Submit",
    "pt_DEMO": "Enviar"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_LOCATION_LABEL_TEXT",
    "en_DEMO": "Household Location",
    "pt_DEMO": "Localiza��o da fam�lia"
  },
  {
    "module": "hcm-household",
    "code": "ADMINISTRATION_AREA_FORM_LABEL",
    "en_DEMO": "Administrative Area",
    "pt_DEMO": "�rea administrativa"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_ADDRESS_LINE_1_FORM_LABEL",
    "en_DEMO": "Address Line 1",
    "pt_DEMO": "Endere�o Linha 1"
  },
  {
    "module": "hcm-household",
    "code": "LANDMARK_FORM_LABEL",
    "en_DEMO": "Landmark",
    "pt_DEMO": "Marco"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_ADDRESS_LINE_2_FORM_LABEL",
    "en_DEMO": "Address Line 2",
    "pt_DEMO": "endere�o linha 2"
  },
  {
    "module": "hcm-household",
    "code": "POSTAL_CODE_FORM_LABEL",
    "en_DEMO": "Postal Code",
    "pt_DEMO": "C�digo postal"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_LOCATION_ACTION_LABEL",
    "en_DEMO": "Next",
    "pt_DEMO": "Pr�ximo"
  },
  {
    "module": "hcm-acknowledgement",
    "code": "ACKNOWLEDGEMENT_SUCCESS_ACTION_LABEL_TEXT",
    "en_DEMO": "Data recorded successfully",
    "pt_DEMO": "Dados registrados com sucesso"
  },
  {
    "module": "hcm-acknowledgement",
    "code": "ACKNOWLEDGEMENT_SUCCESS_DESCRIPTION_TEXT",
    "en_DEMO": "The data has been recorded successfully.",
    "pt_DEMO": "Os dados foram registrados com sucesso."
  },
  {
    "module": "hcm-acknowledgement",
    "code": "ACKNOWLEDGEMENT_SUCCESS_LABEL_TEXT",
    "en_DEMO": "Back to Search",
    "pt_DEMO": "De volta � pesquisa"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_DETAILS_LABEL",
    "en_DEMO": "Household Details",
    "pt_DEMO": "Detalhes da fam�lia"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_ACTION_LABEL",
    "en_DEMO": "Next",
    "pt_DEMO": "Pr�ximo"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_DETAILS_DATE_OF_REGISTRATION_LABEL",
    "en_DEMO": "Date of Registration",
    "pt_DEMO": "Data de registro"
  },
  {
    "module": "hcm-household",
    "code": "NO_OF_MEMBERS_COUNT_LABEL",
    "en_DEMO": "Number of members living in the household*",
    "pt_DEMO": "N�mero de membros que vivem na casa*"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_LABEL",
    "en_DEMO": "Household",
    "pt_DEMO": "Dom�stico"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_EDIT_ICON_LABEL",
    "en_DEMO": "Edit household",
    "pt_DEMO": "Editar fam�lia"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_DELETE_ICON_LABEL",
    "en_DEMO": "Delete Household",
    "pt_DEMO": "Excluir fam�lia"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_EDIT_ICON_LABEL_TEXT",
    "en_DEMO": "Edit",
    "pt_DEMO": "Editar"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_ACTION_CARD_TITLE",
    "en_DEMO": "Do you want to delete this\nbeneficiary?",
    "pt_DEMO": "Voc� quer excluir isso\nbenefici�rio?"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_PRIMARY_ACTION_LABEL",
    "en_DEMO": "Delete",
    "pt_DEMO": "Excluir"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_SECONDARY_ACTION_LABEL",
    "en_DEMO": "Cancel",
    "pt_DEMO": "Cancelar"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_DELIVERED_ICON_LABEL",
    "en_DEMO": "Delivered",
    "pt_DEMO": "Entregue"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_NOT_DELIVERED_ICON_LABEL",
    "en_DEMO": "Not Delivered",
    "pt_DEMO": "N�o entregue"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_HOUSEHOLD_HEAD_LABEL",
    "en_DEMO": "Household\nHead",
    "pt_DEMO": "Dom�stico\nCabe�a"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_HOUSEHOLD_HEAD_NAME_LABEL",
    "en_DEMO": "Household Head Name:",
    "pt_DEMO": "Nome da cabe�a da fam�lia:"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_ACTION_TEXT",
    "en_DEMO": "Deliver Intervention",
    "pt_DEMO": "Entregar interven��o"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW__ADD_ACTION_TEXT",
    "en_DEMO": "Add Member",
    "pt_DEMO": "Adicionar membro"
  },
  {
    "module": "hcm-member",
    "code": "MEMBER_CARD_ASSIGN_AS_HEAD",
    "en_DEMO": "Assign as household head",
    "pt_DEMO": "Designe como chefe de fam�lia"
  },
  {
    "module": "hcm-member",
    "code": "MEMBER_CARD_EDIT_INDIVIDUALDETAILS",
    "en_DEMO": "Edit",
    "pt_DEMO": "Editar"
  },
  {
    "module": "hcm-member",
    "code": "MEMBER_CARD_EDIT_INDIVIDUAL_ACTION_TEXT",
    "en_DEMO": "Edit  Individual Details",
    "pt_DEMO": "Edite detalhes individuais"
  },
  {
    "module": "hcm-member",
    "code": "MEMBER_CARD_DELIVER_INTERVENTION_SUBMIT_LABEL",
    "en_DEMO": "Submit",
    "pt_DEMO": "Enviar"
  },
  {
    "module": "hcm-member",
    "code": "MEMBER_CARD_DELIVER_DETAILS_UPDATE_LABEL",
    "en_DEMO": "Update Delivery Details",
    "pt_DEMO": "Atualizar detalhes de entrega"
  },
  {
    "module": "hcm-member",
    "code": "MEMBER_CARD_DELIVER_DETAILS_YEAR_TEXT",
    "en_DEMO": "years",
    "pt_DEMO": "anos"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_LABEL",
    "en_DEMO": "Deliver Intervention",
    "pt_DEMO": "Entregar interven��o"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_DATE_OF_REGISTRATION_LABEL",
    "en_DEMO": "Date of Registration:",
    "pt_DEMO": "Data de registro:"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_RESOURCE_DELIVERED_LABEL",
    "en_DEMO": "Resource Delivered*",
    "pt_DEMO": "Recurso entregue*"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_QUANTITY_DISTRIBUTED_LABEL",
    "en_DEMO": "Quantity Distributed*",
    "pt_DEMO": "Quantidade distribu�da*"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_DELIVERY_COMMENT_LABEL",
    "en_DEMO": "Delivery Comment",
    "pt_DEMO": "Coment�rio de entrega"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_ID_TYPE_TEXT",
    "en_DEMO": "ID Type:",
    "pt_DEMO": "Tipo de identifica��o:"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_ID_NUMBER_TEXT",
    "en_DEMO": "ID Number:",
    "pt_DEMO": "N�mero de identidade:"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_MEMBER_COUNT_TEXT",
    "en_DEMO": "Member Count:",
    "pt_DEMO": "Contagem de membro:"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_NO_OF_RESOURCES_FOR_DELIVERY",
    "en_DEMO": "Number Of Resources For Delivery:",
    "pt_DEMO": "N�mero de recursos para entrega:"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_DIALOG_TITLE",
    "en_DEMO": "Ready to Submit?",
    "pt_DEMO": "Pronto para enviar?"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_DIALOG_CONTENT",
    "en_DEMO": "Make sure you review all details before clicking on the Submit button. Click on the Cancel button to go back to the previous page.",
    "pt_DEMO": "Certifique -se de revisar todos os detalhes antes de clicar no bot�o Enviar. Clique no bot�o Cancelar para voltar para a p�gina anterior."
  }
] as LocalizationInput[];

const output = load(input);
console.log(output);

function load(data: LocalizationInput[]): LocalizationOutput[] {
    let outputArray: LocalizationOutput[] = [];

    data.forEach((e) => {
        outputArray.push({
            code: e.code,
            locale: 'en_DEMO',
            message: e.en_DEMO,
            module: e.module
        });

        outputArray.push({
            code: e.code,
            locale: 'pt_DEMO',
            message: e.pt_DEMO,
            module: e.module
        });
    });

    return outputArray;
}