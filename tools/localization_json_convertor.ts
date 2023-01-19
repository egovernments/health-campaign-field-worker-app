interface LocalizationInput {
    code: string;
    module: string;
    en_MZ: string;
    pt_MZ: string;
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
    "en_MZ": "Continue",
    "pt_MZ": "Prosseguir"
  },
  {
    "module": "hcm-common",
    "code": "CORE_COMMON_AGE",
    "en_MZ": "Age",
    "pt_MZ": "Era"
  },
  {
    "module": "hcm-common",
    "code": "CORE_COMMON_GENDER",
    "en_MZ": "Gender",
    "pt_MZ": "G�nero"
  },
  {
    "module": "hcm-common",
    "code": "CORE_COMMON_MOBILE_NUMBER",
    "en_MZ": "Mobile Number",
    "pt_MZ": "N�mero de celular"
  },
  {
    "module": "hcm-common",
    "code": "CORE_COMMON_SUBMIT",
    "en_MZ": "Submit",
    "pt_MZ": "Enviar"
  },
  {
    "module": "hcm-common",
    "code": "CORE_COMMON_CANCEL",
    "en_MZ": "Cancel",
    "pt_MZ": "Cancelar"
  },
  {
    "module": "hcm-login",
    "code": "LOGIN_LABEL_TEXT",
    "en_MZ": "Login",
    "pt_MZ": "Conecte-se"
  },
  {
    "module": "hcm-login",
    "code": "USER_ID_PLACEHOLDER",
    "en_MZ": "User ID",
    "pt_MZ": "ID do usu�rio"
  },
  {
    "module": "hcm-login",
    "code": "PASSWORD_PLACEHOLDER",
    "en_MZ": "Password",
    "pt_MZ": "Senha"
  },
  {
    "module": "hcm-login",
    "code": "LOGIN_ACTION_LABEL",
    "en_MZ": "Login",
    "pt_MZ": "Conecte-se"
  },
  {
    "module": "hcm-forgot-password",
    "code": "FORGOT_PASSWORD_LABEL_TEXT",
    "en_MZ": "Forgot Password",
    "pt_MZ": "Esqueceu a senha"
  },
  {
    "module": "hcm-forgot-password",
    "code": "FORGOT_PASSWORD_CONTENT_TEXT",
    "en_MZ": "Please contact your administrator if you have forgotten your password",
    "pt_MZ": "Entre em contato com seu administrador se voc� esqueceu sua senha"
  },
  {
    "module": "hcm-forgot-password",
    "code": "PRIMARY_ACTION_LABEL",
    "en_MZ": "OK",
    "pt_MZ": "OK"
  },
  {
    "module": "hcm-forgot-password",
    "code": "FORGOT_PASSWORD_ACTION_LABEL",
    "en_MZ": "Forgot Password?",
    "pt_MZ": "Esqueceu a senha?"
  },
  {
    "module": "hcm-home",
    "code": "HOME_BENEFICIARY_LABEL",
    "en_MZ": "Beneficiaries",
    "pt_MZ": "Benefici�rios"
  },
  {
    "module": "hcm-home",
    "code": "HOME_VIEW_REPORTS_LABEL",
    "en_MZ": "View Reports",
    "pt_MZ": "Ver relat�rios"
  },
  {
    "module": "hcm-home",
    "code": "HOME_SYNC_DATA_LABEL",
    "en_MZ": "Sync Data",
    "pt_MZ": "Dados de sincroniza��o"
  },
  {
    "module": "hcm-home",
    "code": "HOME_CALL_BACK_LABEL",
    "en_MZ": "Call Supervisor",
    "pt_MZ": "Ligue para o supervisor"
  },
  {
    "module": "hcm-home",
    "code": "HOME_FILE_COMPLAINT",
    "en_MZ": "File Complaint",
    "pt_MZ": "Reclama��o do arquivo"
  },
  {
    "module": "hcm-home",
    "code": "PROGRESS_INDICATOR_TITLE",
    "en_MZ": "more to reach target",
    "pt_MZ": "mais para atingir o alvo"
  },
  {
    "module": "hcm-home",
    "code": "PROGRESS_INDICATOR_PREFIX_LABEL",
    "en_MZ": "completed",
    "pt_MZ": "conclu�do"
  },
  {
    "module": "hcm-beneficiary",
    "code": "BENEFICIARY_STATISTICS_LABEL_TEXT",
    "en_MZ": "Search Households",
    "pt_MZ": "Pesquise fam�lias"
  },
  {
    "module": "hcm-beneficiary",
    "code": "NO_OF_HOUSEHOLDS_REGISTERED",
    "en_MZ": "No. of Households\nRegistered",
    "pt_MZ": "No. de fam�lias\nRegistrado"
  },
  {
    "module": "hcm-beneficiary",
    "code": "NO_OF_RESOURCES_DELIVERED",
    "en_MZ": "No. of Bednets\nDelivered",
    "pt_MZ": "No. de redes de cama\nEntregue"
  },
  {
    "module": "hcm-beneficiary",
    "code": "BENEFICIARY_SEARCH_HINT_TEXT",
    "en_MZ": "Enter the name of household head",
    "pt_MZ": "Digite o nome do chefe da fam�lia"
  },
  {
    "module": "hcm-beneficiary",
    "code": "BENEFICIARY_INFO_DESCRIPTION",
    "en_MZ": "Click on Register New Household button to add details.",
    "pt_MZ": "Clique em Registrar um novo bot�o dom�stico para adicionar detalhes."
  },
  {
    "module": "hcm-beneficiary",
    "code": "BENEFICIARY_INFO_TITLE",
    "en_MZ": "Match not found!",
    "pt_MZ": "Match n�o encontrado!"
  },
  {
    "module": "hcm-beneficiary",
    "code": "BENEFICIARY_ADD_ACTION_LABEL",
    "en_MZ": "Register New Household",
    "pt_MZ": "Registrar uma nova fam�lia"
  },
  {
    "module": "hcm-beneficiary",
    "code": "ICON_LABEL",
    "en_MZ": "Open",
    "pt_MZ": "Abrir"
  },
  {
    "module": "hcm-beneficiary",
    "code": "INDIVIDUAL_LABEL_TEXT",
    "en_MZ": "Individual Details",
    "pt_MZ": "Detalhes individuais"
  },
  {
    "module": "hcm-beneficiary",
    "code": "INDIVIDUAL_NAME_LABEL_TEXT",
    "en_MZ": "Name of the Individual*",
    "pt_MZ": "Nome do indiv�duo*"
  },
  {
    "module": "hcm-beneficiary",
    "code": "HEAD_OF_HOUSEHOLD_LABEL_TEXT",
    "en_MZ": "Head of household",
    "pt_MZ": "Chefe de fam�lia"
  },
  {
    "module": "hcm-beneficiary",
    "code": "ID_TYPE_LABEL_TEXT",
    "en_MZ": "ID Type",
    "pt_MZ": "Tipo de identifica��o"
  },
  {
    "module": "hcm-beneficiary",
    "code": "ID_NUMBER_LABEL_TEXT",
    "en_MZ": "ID Number*",
    "pt_MZ": "N�mero de identidade*"
  },
  {
    "module": "hcm-beneficiary",
    "code": "ID_NUMBER_SUGGESTION_TEXT",
    "en_MZ": "Enter 10 digit ID number",
    "pt_MZ": "Insira o n�mero de identifica��o de 10 d�gitos"
  },
  {
    "module": "hcm-beneficiary",
    "code": "DOB_LABEL_TEXT",
    "en_MZ": "Date of Birth",
    "pt_MZ": "Data de nascimento"
  },
  {
    "module": "hcm-common",
    "code": "AGE_LABEL_TEXT",
    "en_MZ": "Age",
    "pt_MZ": "Era"
  },
  {
    "module": "hcm-common",
    "code": "SEPARATOR_LABEL_TEXT",
    "en_MZ": "(or)",
    "pt_MZ": "(ou)"
  },
  {
    "module": "hcm-common",
    "code": "GENDER_LABEL_TEXT",
    "en_MZ": "Gender",
    "pt_MZ": "G�nero"
  },
  {
    "module": "hcm-common",
    "code": "MOBILE_NUMBER_LABEL_TEXT",
    "en_MZ": "Mobile Number",
    "pt_MZ": "N�mero de celular"
  },
  {
    "module": "hcm-common",
    "code": "SUBMIT_LABEL_TEXT",
    "en_MZ": "Submit",
    "pt_MZ": "Enviar"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_LOCATION_LABEL_TEXT",
    "en_MZ": "Household Location",
    "pt_MZ": "Localiza��o da fam�lia"
  },
  {
    "module": "hcm-household",
    "code": "ADMINISTRATION_AREA_FORM_LABEL",
    "en_MZ": "Administrative Area",
    "pt_MZ": "�rea administrativa"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_ADDRESS_LINE_1_FORM_LABEL",
    "en_MZ": "Address Line 1",
    "pt_MZ": "Endere�o Linha 1"
  },
  {
    "module": "hcm-household",
    "code": "LANDMARK_FORM_LABEL",
    "en_MZ": "Landmark",
    "pt_MZ": "Marco"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_ADDRESS_LINE_2_FORM_LABEL",
    "en_MZ": "Address Line 2",
    "pt_MZ": "endere�o linha 2"
  },
  {
    "module": "hcm-household",
    "code": "POSTAL_CODE_FORM_LABEL",
    "en_MZ": "Postal Code",
    "pt_MZ": "C�digo postal"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_LOCATION_ACTION_LABEL",
    "en_MZ": "Next",
    "pt_MZ": "Pr�ximo"
  },
  {
    "module": "hcm-acknowledgement",
    "code": "ACKNOWLEDGEMENT_SUCCESS_ACTION_LABEL_TEXT",
    "en_MZ": "Data recorded successfully",
    "pt_MZ": "Dados registrados com sucesso"
  },
  {
    "module": "hcm-acknowledgement",
    "code": "ACKNOWLEDGEMENT_SUCCESS_DESCRIPTION_TEXT",
    "en_MZ": "The data has been recorded successfully.",
    "pt_MZ": "Os dados foram registrados com sucesso."
  },
  {
    "module": "hcm-acknowledgement",
    "code": "ACKNOWLEDGEMENT_SUCCESS_LABEL_TEXT",
    "en_MZ": "Back to Search",
    "pt_MZ": "De volta � pesquisa"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_DETAILS_LABEL",
    "en_MZ": "Household Details",
    "pt_MZ": "Detalhes da fam�lia"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_ACTION_LABEL",
    "en_MZ": "Next",
    "pt_MZ": "Pr�ximo"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_DETAILS_DATE_OF_REGISTRATION_LABEL",
    "en_MZ": "Date of Registration",
    "pt_MZ": "Data de registro"
  },
  {
    "module": "hcm-household",
    "code": "NO_OF_MEMBERS_COUNT_LABEL",
    "en_MZ": "Number of members living in the household*",
    "pt_MZ": "N�mero de membros que vivem na casa*"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_LABEL",
    "en_MZ": "Household",
    "pt_MZ": "Dom�stico"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_EDIT_ICON_LABEL",
    "en_MZ": "Edit household",
    "pt_MZ": "Editar fam�lia"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_DELETE_ICON_LABEL",
    "en_MZ": "Delete Household",
    "pt_MZ": "Excluir fam�lia"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_EDIT_ICON_LABEL_TEXT",
    "en_MZ": "Edit",
    "pt_MZ": "Editar"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_ACTION_CARD_TITLE",
    "en_MZ": "Do you want to delete this\nbeneficiary?",
    "pt_MZ": "Voc� quer excluir isso\nbenefici�rio?"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_PRIMARY_ACTION_LABEL",
    "en_MZ": "Delete",
    "pt_MZ": "Excluir"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_SECONDARY_ACTION_LABEL",
    "en_MZ": "Cancel",
    "pt_MZ": "Cancelar"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_DELIVERED_ICON_LABEL",
    "en_MZ": "Delivered",
    "pt_MZ": "Entregue"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_NOT_DELIVERED_ICON_LABEL",
    "en_MZ": "Not Delivered",
    "pt_MZ": "N�o entregue"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_HOUSEHOLD_HEAD_LABEL",
    "en_MZ": "Household\nHead",
    "pt_MZ": "Dom�stico\nCabe�a"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_HOUSEHOLD_HEAD_NAME_LABEL",
    "en_MZ": "Household Head Name:",
    "pt_MZ": "Nome da cabe�a da fam�lia:"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW_ACTION_TEXT",
    "en_MZ": "Deliver Intervention",
    "pt_MZ": "Entregar interven��o"
  },
  {
    "module": "hcm-household",
    "code": "HOUSEHOLD_OVER_VIEW__ADD_ACTION_TEXT",
    "en_MZ": "Add Member",
    "pt_MZ": "Adicionar membro"
  },
  {
    "module": "hcm-member",
    "code": "MEMBER_CARD_ASSIGN_AS_HEAD",
    "en_MZ": "Assign as household head",
    "pt_MZ": "Designe como chefe de fam�lia"
  },
  {
    "module": "hcm-member",
    "code": "MEMBER_CARD_EDIT_INDIVIDUALDETAILS",
    "en_MZ": "Edit",
    "pt_MZ": "Editar"
  },
  {
    "module": "hcm-member",
    "code": "MEMBER_CARD_EDIT_INDIVIDUAL_ACTION_TEXT",
    "en_MZ": "Edit  Individual Details",
    "pt_MZ": "Edite detalhes individuais"
  },
  {
    "module": "hcm-member",
    "code": "MEMBER_CARD_DELIVER_INTERVENTION_SUBMIT_LABEL",
    "en_MZ": "Submit",
    "pt_MZ": "Enviar"
  },
  {
    "module": "hcm-member",
    "code": "MEMBER_CARD_DELIVER_DETAILS_UPDATE_LABEL",
    "en_MZ": "Update Delivery Details",
    "pt_MZ": "Atualizar detalhes de entrega"
  },
  {
    "module": "hcm-member",
    "code": "MEMBER_CARD_DELIVER_DETAILS_YEAR_TEXT",
    "en_MZ": "years",
    "pt_MZ": "anos"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_LABEL",
    "en_MZ": "Deliver Intervention",
    "pt_MZ": "Entregar interven��o"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_DATE_OF_REGISTRATION_LABEL",
    "en_MZ": "Date of Registration:",
    "pt_MZ": "Data de registro:"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_RESOURCE_DELIVERED_LABEL",
    "en_MZ": "Resource Delivered*",
    "pt_MZ": "Recurso entregue*"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_QUANTITY_DISTRIBUTED_LABEL",
    "en_MZ": "Quantity Distributed*",
    "pt_MZ": "Quantidade distribu�da*"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_DELIVERY_COMMENT_LABEL",
    "en_MZ": "Delivery Comment",
    "pt_MZ": "Coment�rio de entrega"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_ID_TYPE_TEXT",
    "en_MZ": "ID Type:",
    "pt_MZ": "Tipo de identifica��o:"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_ID_NUMBER_TEXT",
    "en_MZ": "ID Number:",
    "pt_MZ": "N�mero de identidade:"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_MEMBER_COUNT_TEXT",
    "en_MZ": "Member Count:",
    "pt_MZ": "Contagem de membro:"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_NO_OF_RESOURCES_FOR_DELIVERY",
    "en_MZ": "Number Of Resources For Delivery:",
    "pt_MZ": "N�mero de recursos para entrega:"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_DIALOG_TITLE",
    "en_MZ": "Ready to Submit?",
    "pt_MZ": "Pronto para enviar?"
  },
  {
    "module": "hcm-delivery",
    "code": "DELIVER_INTERVENTION_DIALOG_CONTENT",
    "en_MZ": "Make sure you review all details before clicking on the Submit button. Click on the Cancel button to go back to the previous page.",
    "pt_MZ": "Certifique -se de revisar todos os detalhes antes de clicar no bot�o Enviar. Clique no bot�o Cancelar para voltar para a p�gina anterior."
  }
] as LocalizationInput[];

const output = load(input);
console.log(output);

function load(data: LocalizationInput[]): LocalizationOutput[] {
    let outputArray: LocalizationOutput[] = [];

    data.forEach((e) => {
        outputArray.push({
            code: e.code,
            locale: 'en_MZ',
            message: e.en_MZ,
            module: e.module
        });

        outputArray.push({
            code: e.code,
            locale: 'pt_MZ',
            message: e.pt_MZ,
            module: e.module
        });
    });

    return outputArray;
}